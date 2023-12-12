Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B027280E45A
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 07:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78ADB10E561;
	Tue, 12 Dec 2023 06:40:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5BE10E561
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 06:40:40 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d226f51f71so51920567b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702363239; x=1702968039; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lcEihlupVu268DH+1hoAuEO92XmVKwEZxV6GmYSg0is=;
 b=DXVeZGpXs8BJeOoY+gLYqxOGjgcnlQlymqTasuktHbml1AD125B9qXhQBGpJ7miIwi
 BNJQ2Y6bg/3OZEKbtO8udo3REfHC6PWhDlQqdI6NkfXBChvfJKDiXcDI+BOR44K54aFK
 JBXeLXbouHWGSX0Ch31RcGZ6ZBI7wyhLqVgtmwmq6xMQdv26BQlysSLPgdJGN4NmOPUV
 ZpuRd1ck77PVN7FHUO3DMq8YaMoZzpAqq18HSBJEZUccnoB8+6PwMVl5rBrmZHq4fx5t
 WGSiR3JD+1RfKL3URatYMwlAXf5aOInG0d9iuPdQRGySk9Zd+pa3WkwB6NwUg/qJKXF1
 SCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702363239; x=1702968039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lcEihlupVu268DH+1hoAuEO92XmVKwEZxV6GmYSg0is=;
 b=p6DhAg81Aul+sJsmrH3h+HWm/w6IMNhsH0aoSkKZQTsSpU+z4iVdJcLKx9uGJBeIQu
 zZ/GrDMd7wXpXo/jR9vhisdpP3mNRyZwk3h+nSJyCSUsUfdmAwOaD1hx1vWGoZMFx6MA
 rJKrMYnadDGh5/S4Rr3VfaiLktIK0eoI68WNvU9pyP/Il1TlpZbwIFeNupUvE3yFLh8g
 aBILgUZ8LjPXdLxbRe97HR7sfTmo3CLIxauddSrVOJYhmX2gUMvsVeHFmel1a+0rCMyd
 dKWciz8q26pwTjyskNnMm/IOs6IaBcf3aV+TJpzlU99KG5CEzWAX4aG8GuSN5+AQsIXA
 SuXg==
X-Gm-Message-State: AOJu0YxtEsvhrVKxW8pjkQCoqVRGv5bZXZoG466uh/BM2t+ko4E6xV8O
 jEN82Vh4F0JU0FJMEKnvCLHFmiSddQisuDXS85nBHQ==
X-Google-Smtp-Source: AGHT+IGvdM5RN8xlu8UqMlYeZbm9dcOMR2ckPy/eZiaBukMGeBzh2gvRdEC6oHdspw1yXZaOd4HQflJN0ZoVqg9U260=
X-Received: by 2002:a0d:f943:0:b0:5d7:1940:dd69 with SMTP id
 j64-20020a0df943000000b005d71940dd69mr4160485ywf.63.1702363239266; Mon, 11
 Dec 2023 22:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
 <20231212002245.23715-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:40:28 +0200
Message-ID: <CAA8EJpqJOh0R1X3i1UGe9hHoezV4uBNDCWPFSdeuXyC6Ju4eHA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] drm/msm/dpu: add formats check for writeback
 encoder
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, seanpaul@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation for adding more formats to dpu writeback add
> format validation to it to fail any unsupported formats.
>
> changes in v3:
>         - rebase on top of msm-next
>         - replace drm_atomic_helper_check_wb_encoder_state() with
>           drm_atomic_helper_check_wb_connector_state() due to the
>           rebase
>
> changes in v2:
>         - correct some grammar in the commit text
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index bb94909caa25..425415d45ec1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -272,6 +272,7 @@ static int dpu_encoder_phys_wb_atomic_check(
>  {
>         struct drm_framebuffer *fb;
>         const struct drm_display_mode *mode = &crtc_state->mode;
> +       int ret;
>
>         DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
>                         phys_enc->hw_wb->idx, mode->name, mode->hdisplay, mode->vdisplay);
> @@ -308,6 +309,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return -EINVAL;
>         }
>
> +       ret = drm_atomic_helper_check_wb_connector_state(conn_state->connector, conn_state->state);
> +       if (ret < 0) {
> +               DPU_ERROR("invalid pixel format %p4cc\n", &fb->format->format);
> +               return ret;
> +       }

There is no guarantee that there will be no other checks added to this
helper. So, I think this message is incorrect. If you wish, you can
promote the level of the message in the helper itself.
On the other hand, we rarely print such messages by default. Most of
the checks use drm_dbg.

> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
