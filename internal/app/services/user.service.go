package services

type UserService interface {
	Register(ctx context.Context, dto dto,RegisterDto) error
}
