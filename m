Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A017C6E2B69
	for <lists+freedreno@lfdr.de>; Fri, 14 Apr 2023 23:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA3C10EE78;
	Fri, 14 Apr 2023 21:01:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E10210E22A
 for <freedreno@lists.freedesktop.org>; Fri, 14 Apr 2023 21:01:49 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id n203so8473534ybg.6
 for <freedreno@lists.freedesktop.org>; Fri, 14 Apr 2023 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681506108; x=1684098108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpfMXe/KqbWIelZJe4uoAyC5aNyWUPiACGVGh2qmwy4=;
 b=ESxeOXEPGqrm0OS/iNJo92P5dIcNLtF7YiRD/kjS8BUetUNEyGG7UaUQoJoAoqLqss
 jxVBbTO2w39KwZLpr9YYuLgInyUGx1ZkwhzNueqqlfVLpPqQOJd1b+77d0mR39cxYqQn
 2/lDQzTCSEMjoGhVcVsGyjnRl84ypMIACewEg12ToTddPHqAN99b4nJZIlcgoTRu2yLz
 JEOugPwNuXnJUehwVqNeK+NeAu3vIr2+6x9Dhpru0CxqMYKizlccomIHjSJCjfG9Is6e
 J5ZfnZ2NH/mk4S4tSwgeGm6t5RQeqChr6g+QMSRPjvgdD9QrWCIYfZuaPtWpYPzZkKB3
 RXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681506108; x=1684098108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpfMXe/KqbWIelZJe4uoAyC5aNyWUPiACGVGh2qmwy4=;
 b=Q6lnXwP6uSKcARkRd1t+D+MqnpzjXUmnlvR/9bAJVAFHop73kvDH2WGp7C2ewjiPgT
 0/r+9lxlQBnnW9g2KG/LlXeUV7jYfRkfO/87bPt5vP6F5yfxdB1qbIL5DElhi5j5qJeH
 F57oPgIG7P5W3vDpQokGuY/P+7Ou310CLXJM8BYHGu+7s+kY5z4IHwZMHpX+LR9lRv6T
 f8UBGMJi9j/GBM3rnUS/Gds6HDomRaxirg1Pq2aYJo/WFtLh8ievwdPNbkWF7JUbF+nA
 vlenlwLrk+TXYVqa1I2Xz6ZBsXJwIkChvLkDBEJdoVmCQQ+VbpBxpAdDCipX84F4nqZS
 G9Ng==
X-Gm-Message-State: AAQBX9d1c8FSRoJN8SIgFhlEO5CvowMAK1Qjz/Z8iuLcm6BcOoy6O6Fa
 bjG5GAj0XSu0URfo9xY6I1lNvpJ8IsOtCsI3QHFbMw==
X-Google-Smtp-Source: AKy350a6AQhCKOCqsuAPG4WgtTUaUp2Zmf+Z17MMZxfmVFeziyrPpCdMUQwN/3lykz1gOYCumpn4K1dyAr2SD+v3B60=
X-Received: by 2002:a25:748e:0:b0:b6c:2d28:b3e7 with SMTP id
 p136-20020a25748e000000b00b6c2d28b3e7mr4606248ybc.9.1681506108117; Fri, 14
 Apr 2023 14:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Apr 2023 00:01:37 +0300
Message-ID: <CAA8EJppy0bGKQsQFoDZtWgtKrZuU5NLVoteXMbqDR30Var92NA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: always program DSC active
 bits
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023 at 19:46, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> In current code, the dsc active bits are set only if the cfg->dsc is set.
> However, for displays which are hot-pluggable, there can be a use-case
> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>
> For those cases we need to clear DSC active bits during teardown.
>
> As discuss at [1], clear DSC active bit will handled at reset_intf_cfg()

nit: discussed

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> [1] https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
> ---

Changelog? This is v3 already, but it has no changes described.

>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95c..88e4efe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         if (cfg->merge_3d)
>                 DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>                               BIT(cfg->merge_3d - MERGE_3D_0));
> -       if (cfg->dsc) {
> -               DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> -               DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -       }
> +

And the comment got dropped. Please restore it in some form.

> +       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +       DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>  }
>
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
