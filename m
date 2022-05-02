Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B4D516BAC
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 10:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77A510EB31;
	Mon,  2 May 2022 08:06:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598910EB34
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 08:06:16 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id s30so24764104ybi.8
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9eaNjP1Hc5RWxu4zMYHv8damjahal2K/XyzOk50wqY=;
 b=JWbLjTAzjww6Ku0NGdngxLti8xtbrCjaNcdHNGTch7Yv62Fx/M83ANC7iI7dIwQ+U2
 LgVJHIVbGQ+C52cdBr/tYPXPik6LH1Xv1OXwUoRfE3idZbHFrJDOMFJ3u9aA+U9grcW/
 PEHxktD6JeYOb5K7zxpvLA1w6kKiGaBZkYM+AD5RQ2CtDgX6X1F5EALyQv23TZbxK224
 cTk32JLSYWZLQ66caAG5rjuaf1lIGUw9C2vmxaNdSM5+1M0M8DKhTZPHiuS3DxvTAE/v
 WFoFCS9h4LPiozYzvNFZtJMD1WfjYWfruY3CIX2eIdE43MXqZzN3B0Tfp9MytDTmU82S
 rgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9eaNjP1Hc5RWxu4zMYHv8damjahal2K/XyzOk50wqY=;
 b=PXFNdnH5Ikj/MFihfozK8TgUFEv4AnBcE8XTStfw4tguSHAOepCqSQmyiXf3/6sQBh
 2w/j8jj+snCDXf/dzTU3gsl95I6qS8XMy69xV7ebMjMYFAfJ0Oim/m72Tw1p/QyBXZuF
 vgLRqLnpQ63XIuGyd/k7nlNSyHA26PPmWINlYYVxtfXpyAetA5l8g7E2IzepvsRw5PGC
 1/FX954Q61tdQwM6RHWRGfpc8QSUhthgBZ6W52R5IrrbPw8dZhNHuCQLz7kjAUG0udBZ
 1RFRD7QlDSEulKkIoa7W6KfemLml++266JawAUb0AnqqS6+/ZahzFieY+peXN4jNhGRw
 gWzQ==
X-Gm-Message-State: AOAM532IWKLjWd6aE3zrGXouc2BaYuqBAY9QTdbV8WNdnLYJY0e7csTY
 HovXo7AdX6qTWkxITCS+fi3JK4+hgf+y2kl8D0c1cQ==
X-Google-Smtp-Source: ABdhPJwbPF8Gx37GDzvQ03IPIWQaP5P5hDDTyNhHcE4+LwmFbAnY1PS/IxdIRxHIDTmiGY0RBzjefqNdCFycdR/9Ox4=
X-Received: by 2002:a25:84c1:0:b0:63e:7733:f95a with SMTP id
 x1-20020a2584c1000000b0063e7733f95amr8845089ybm.234.1651478775351; Mon, 02
 May 2022 01:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 2 May 2022 11:06:04 +0300
Message-ID: <CAA8EJpr1YigPrMqd64HXN+2NKZQHyXF_ZGZETv8FFBn2yW2kOQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add missing break statement
 for update_pending_flush_wb()
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 2 May 2022 at 08:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add missing break statement for dpu_hw_ctl_update_pending_flush_wb().
> Otherwise this leads to below build warning.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> warning: unannotated fall-through between switch labels
>            default:
>            ^
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> note: insert 'break;' to avoid fall-through
>            default:
>            ^
>            break;
> 1 warning generated.
>
> Fixes: 2e0086d8c61d ("drm/msm/dpu: add changes to support writeback in hw_ctl")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 254fdf06bb42..c33e7ef611a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -270,6 +270,7 @@ static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
>         case WB_1:
>         case WB_2:
>                 ctx->pending_flush_mask |= BIT(WB_IDX);
> +               break;
>         default:
>                 break;
>         }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
