Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71438896ADD
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 11:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53A1112949;
	Wed,  3 Apr 2024 09:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SYLg4hiH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C07112947
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 09:41:35 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc742543119so6041518276.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712137294; x=1712742094; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
 b=SYLg4hiHJQuqxeLayt9n+2RxsClGKh1tAFADfvjfFwmxIT+sUX2MAjbyoqLEOKV4Vd
 iyPfov4gqub03i5pqfXR32yMN5rBaOJoQuAk2dXMypDktOJaBr+lMIC6C1tzifmNZ103
 hoyxxTQoqyLmZTNj6qfKUlcgfM7+kpKysQqwDHfWN5S5R8FyJjZHYQ5OHmwfX6NkNl2t
 UUDDYy+6bl43CvNcN//bKjBeroe33ew3EYqDIwRDye5U/54NYqzkFae2OiejrpYAJjqa
 n8/qNgeHWGiXp6NuWfrQg8S+VpO6AgsIxCgPzxysRg8ZYb3CF1409VJB+SnOljeZXl+/
 qMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137294; x=1712742094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZyO+QBQa0l1KyC9aVtB+Tynj7pN+XlIzE4CNhhsDWik=;
 b=tCXW/1ZMtrreGzGY/kFKyAHMGya5LSeQ8EqjSR5h3brMEnfwMD4/LRDgKLmMIT2z15
 C4n4Unhst68gC2IqgdnWwuMJMYcvuU1H3QaLJTtMsqVw4Q9Epd5H3sKLVhdn/zqNHB8X
 iG3/0sZEZffOD22fvV9TmXts1FRXwKIF0elK/I/bJpqjGox2Jdx6r8MBI9su/IbyTt0T
 L8b4KNQ5oRRiutQjdatZrH8xoYkNKysk9cYVoC0gl1NWrxedRFrf9Ha+ApD2DREx/NiG
 pmkPlTTcbHuprPL7OqPPwErn0F3qoeSzVNEARHTPXDwuZiehdds6Npk5tYixyn1ADklY
 /HFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyCng7meEDcvHw3XDuE1O/lfUNdyfS3nGVcOhzIb+BHZVX0b8aIa7WZVNbuvW9+jlWPQYK2s5lthtfpS+nwoaCWOric3NKUhYuYv5YCF/T
X-Gm-Message-State: AOJu0YxPYw9hPRf99FUin72sQHOjCrPZRkU2YBNp9k8RNVLtQlnNQsSo
 gp/PCdAHK89v/fnBUgv+zdrkBQeooHmenAbYPUm39il/jzdt+qsN6vzKtapZk/DchTx3r/pFixW
 kcHhlz4hMF8Ot1ySjkBPDC1GE1kC0wSsF4w74yg==
X-Google-Smtp-Source: AGHT+IHo7Vge0DzQtT3KcHX8RHK0g2XNH+Jxl5Eel4VaYYgoWl8Iyz2W7DVZ0oNcZ76UL25OVO7Ocj0cWKDlGl95sZI=
X-Received: by 2002:a25:d606:0:b0:dcb:e82c:f7d with SMTP id
 n6-20020a25d606000000b00dcbe82c0f7dmr653359ybg.41.1712137294567; Wed, 03 Apr
 2024 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-5-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 12:41:23 +0300
Message-ID: <CAA8EJprCf5V7jcR2XCkpkTtRr5f1beHKksL8PJJB_10EDLXEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/display: Add slice_per_pkt for dsc
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add variable for slice number of a DSC compression bit stream packet.
> Its value shall be specified in panel driver, or default value can be set
> in display controller driver if panel driver does not set it.

This is not a part of the standard. Please justify it.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  include/drm/display/drm_dsc.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
> index bc90273d06a6..4fac0a2746ae 100644
> --- a/include/drm/display/drm_dsc.h
> +++ b/include/drm/display/drm_dsc.h
> @@ -82,6 +82,10 @@ struct drm_dsc_config {
>          * @bits_per_component: Bits per component to code (8/10/12)
>          */
>         u8 bits_per_component;
> +       /**
> +        * @slice_per_pkt: slice number per DSC bit stream packet
> +        */
> +       u8 slice_per_pkt;
>         /**
>          * @convert_rgb:
>          * Flag to indicate if RGB - YCoCg conversion is needed
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
