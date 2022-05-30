Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBBE5388AC
	for <lists+freedreno@lfdr.de>; Mon, 30 May 2022 23:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2230D10E146;
	Mon, 30 May 2022 21:49:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1D510E146
 for <freedreno@lists.freedesktop.org>; Mon, 30 May 2022 21:49:54 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b200so11965836qkc.7
 for <freedreno@lists.freedesktop.org>; Mon, 30 May 2022 14:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oyIZLMpN8yM0C+zjTwxWjwcZ2QrcKF6IgeGKdgmBFJY=;
 b=gHcxRtGDoYeO+1kAyP6pFVBMMe0X3RvUE1GAgq20de6KB30VN8KNhd8+GPYpjxwIY5
 KALbPX55/RvHg8AeuuBUC4el4dBrfSm5QYa8H2uW/dP1D7PigbqIlrl084fYKQlgJ10E
 rjdcV65g8ZK0vPIc/mvl+B3HbQbtfCD3+f8RqOH5FB0hd2DyFYG6EPD3ZckOXOjtf6ql
 pUU6rLqd+YbMNhBb6sy1J6kxHWO1pUtOc14aHifvdD+NFbpEZh2DjDpvVP8GBhEoaBya
 6uhd0jw2PLnFaW5RpzLveGX/SVZd+SWgUM/MWyw4FuAuAxlXPXxk3x9gXFrlIWW27Z5x
 HguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oyIZLMpN8yM0C+zjTwxWjwcZ2QrcKF6IgeGKdgmBFJY=;
 b=dsRzBZGh+MYVPCdg+mBqpPC5aZEW8auOSkdwED+PXW6uQjFVsMUxr6vH2v4whNz3FX
 k6VZfAuS7oaF6ykuMtPZsIbo0TD6cj+WqnSOioLWne3Rz6Y6d6WlOId3zUZef4jpSe6g
 VrnPJjkaUiJo604wXNWZVbXJv92UM1mqvWNNjm2Gtg7T6U1WY6Jdwf6YnEIR4tuZIn8b
 Eb03sk38S+1yrp4jtOhSttU26JHQ02NzBLGnCmdHK6/osiH9tssQmGlMfVlHhljg5MBq
 tiZ8zvou2Ox22Gdm9TgFZb7O3wRv+MHSTFd+6IwrfKqTv63hBC4e1SXG8Qz888Qy4B6t
 LNkQ==
X-Gm-Message-State: AOAM5321a/efywYystCRKdyW3W7g6bz0ZufjGpwuIiq1yNpKazMSug4t
 SzXrtnGmFZwnjJWv9/jAaS1Za+ODquELfx894kZM7A==
X-Google-Smtp-Source: ABdhPJwsqssNs4WAxkzWklQmjHdnCgJ3D8qJrLr2CI/UtjeDrebRWydyU53sBgITCNcpLLIKJKP3und/snBq/5zczLM=
X-Received: by 2002:a37:6883:0:b0:6a3:42ae:e17b with SMTP id
 d125-20020a376883000000b006a342aee17bmr36933263qkc.59.1653947393598; Mon, 30
 May 2022 14:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 31 May 2022 00:49:42 +0300
Message-ID: <CAA8EJpqfvMPZza=J-TKxNtP2L1GPsy+va_dJ9EWuCAYtZWQrjA@mail.gmail.com>
To: Haowen Bai <baihaowen@meizu.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix pointer dereferenced
 before checking
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 30 May 2022 at 05:20, Haowen Bai <baihaowen@meizu.com> wrote:
>
> The phys_enc->wb_idx is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
