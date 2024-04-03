Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A7896BCC
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 12:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D022E1125B6;
	Wed,  3 Apr 2024 10:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AgGjLuxc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D861125B6
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 10:14:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcc71031680so5661583276.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712139246; x=1712744046; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wKOQs+TmUwBWd9nBZ5bd0FjYKLI0xx+jqXHAXa7eWSs=;
 b=AgGjLuxcr0BClZqlGQqTycNXZqjKBt5Nyg/VDLoEdQJsP6QTSvTSTd8UvF4c7jSaNp
 D5YW9aplX6WSLtplIiglz0wvaSZAc/wRWL6wye1QZxkfr3LQdDRRVbR8gJ09JF2B5wWS
 8PqKtbf40E8NhIw1Xd6jIdva+MRMqzAY2S72ioH7EB4nWLkApZfTIQMVYWT6R3gqRyap
 Svge6PYjLURYwmAIQI/B86jSC6KayhbEWOxoPT43yIBUXjCch7EpXSETU1P5tct6/F++
 soF2fNspor2jDR6j7VH8fE4nYg/m0jKShwiuSgWvKPw7eR4tl4O/OW5Fch0VJmsqoQHJ
 5GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712139246; x=1712744046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKOQs+TmUwBWd9nBZ5bd0FjYKLI0xx+jqXHAXa7eWSs=;
 b=XpN+0RNCx8CRuat7MZELmXRorDIR7KSR/jY+t1ZKEBU4LbuNYRZGlmdxuVBaDusRtN
 WyUSIFVnNZ12IMykKaY1VD5DvZlaLAtF1YyO2oPDRjnpWvPAUaM3qQZCsIycZAgstf8h
 Yy2K+jJyCEbG1J/EoLtvz0XEJXcbKmw2jyZ436YV32fMcLh+f7SX5mdK7yAXetLdIOF0
 8FW0c00sF1u91WR9Oc5uB21vm42B4GOS6AFWm3KQDhH3Xz63hvOY5OJgMlI/QZkpGdUw
 7bzcBqJz//x+m/zPa3K2ZS6xGU//sqjCcMmz7ZRY7adBRbCtJU7BUyxn6uDMm9lavh5a
 6nfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkRizEr5pMahHSQwCJZY/UYfLyCec1LH5rOfp/R5X6sghLcQYR/2UkN9Y67Zh1zNDu83pJ3f33Lo+dINUQGAWhLZfTFIfk3h04JFOGNC3G
X-Gm-Message-State: AOJu0YxVlnkPjL+7zHHN5Vxw34f+Bm5n6S/yqgjGQpUsvGOCR10gJ6Pq
 FnCVqCYGd7ccGPr886wOYZz6MdpZCamMyZVrNxQyQ1/41SDJLuOaVgYwnEittbFGOgqlnd2ABuc
 88dbud4Rhzw/kcesG8hnuW7f/iygiLNGKmVtVgw==
X-Google-Smtp-Source: AGHT+IGzKMz9/iFfBLaO0Exy3dYLERLc70CKCeB/qcA5U78i+AFMpSfiHPfV1+G4P61zpg9KKbLtmi5hXn167JObpzo=
X-Received: by 2002:a25:b195:0:b0:dca:59a7:896b with SMTP id
 h21-20020a25b195000000b00dca59a7896bmr14271207ybj.50.1712139246514; Wed, 03
 Apr 2024 03:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-3-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:13:55 +0300
Message-ID: <CAA8EJpo1YoLWCPz1TXiV_3YOjOxwxV7Jdq6uhX=15LfWHVBmHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
 (fix video mode DSC)
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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
> From: Jonathan Marek <jonathan@marek.ca>
>
> Video mode DSC won't work if this field is not set correctly. Set it to fix
> video mode DSC (for slice_per_pkt==1 cases at least).
>
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

You S-o-b is missing

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2a0422cad6de..80ea4f1d8274 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -858,6 +858,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         u32 slice_per_intf, total_bytes_per_intf;
>         u32 pkt_per_line;
>         u32 eol_byte_num;
> +       u32 bytes_per_pkt;
>
>         /* first calculate dsc parameters and then program
>          * compress mode registers
> @@ -865,6 +866,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
>
>         eol_byte_num = total_bytes_per_intf % 3;
>
> @@ -902,6 +904,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>                 dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>                 dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>         } else {
> +               reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
>                 dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>         }
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
