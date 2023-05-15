Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375C0704032
	for <lists+freedreno@lfdr.de>; Mon, 15 May 2023 23:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB22B10E2A2;
	Mon, 15 May 2023 21:59:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D25E10E298
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 21:59:32 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-ba1815e12efso11497034276.3
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 14:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187971; x=1686779971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMYm23l9ibyEA8HUJHfl/AvV67A+HY6Cv4WCVFopURo=;
 b=j1X7Qv96dW3f9LQR5chk1cefyZbq//+zHluPryhT2tj+SA/om1LC10EQWZ6hkH6t0+
 57HyfV64mL38B++LU3IVVwl9iZXIGJUeY/DwI/NTMJYUwdgwQYBSSVHxaFK9ryQiQiTt
 J8VpAtBb8lg0pyyHtHOKgGtjQbsms/PdxStFs0eDPYmLPYnHKSP/3TL3QnCbe83tBd6k
 cwdvTAe1zav3udbJjaftZkjXagyGA/9Y2pstMbTt9V+scX85esXJw8knvWHTIviuUJLQ
 DSsfnFV6YOvrCR6n1c1X8bWJOvzao9u06pa4rjXeUKlqytpdqBEalIFaOU+Szrp/baLH
 IzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187971; x=1686779971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMYm23l9ibyEA8HUJHfl/AvV67A+HY6Cv4WCVFopURo=;
 b=lsHYexXouxHV4hXnLlXmv2hq/XiLCFEj6GgOT94J7sHN/VQa9dHwLmn33iaRO9Ylbz
 aSsD22fKnsQ2NqwZrc2yDTHnR4IVY5/A9eQXj8JNJT/5M466Ig9xF4A0FDn8ocVe4cez
 CHJHg/tC5qKHl1PMjdDxRRJTHHEsNs5hYHefNtDWs9PBEtepMzqeJF1k9dpavFsqcZ9b
 m7BmLzPMFt42EZEr7aU+N21LgZQDYgTwqwfYwC6Mv4A72RhcPghTjFlePsFPGh+0MoJb
 sdiroqXCgWn4ZkgBZ6yzBMC3xo322kP0N8cndMB3JxBEGxAlBLYgUUSRTKazlSndIW4C
 FI3g==
X-Gm-Message-State: AC+VfDwyYHCyEAOT4qVwaszsXeLHZU62cWHYq849jpUb7fGYv4I3Wqxe
 oUQdhZMVPkLGGedahVnX6AV+x79dSViIZwNp3N5kTA==
X-Google-Smtp-Source: ACHHUZ5HTNMDc2UouI5L7kXNW7BWxFq3QX5bY09M90wdI7FXDh/qgp2Pl75Yn6yZLGmtyl8wfXAJg1GopJEz8kKUpb8=
X-Received: by 2002:a81:d54b:0:b0:55a:6dc8:e084 with SMTP id
 l11-20020a81d54b000000b0055a6dc8e084mr31032603ywj.17.1684187970898; Mon, 15
 May 2023 14:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-8-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-8-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:59:20 +0300
Message-ID: <CAA8EJprgavuxe+FqVg0vqL+ssaBDu6x1vkJybjAE6G6cpHOAkA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 7/8] drm/msm/dpu: add DSC 1.2 hw blocks
 for relevant chipsets
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
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 airlied@gmail.com, andersson@kernel.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, daniel@ffwll.ch, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
> feature flag information.  Each display compression engine (DCE) contains
> dual hard slice DSC encoders so both share same base address but with
> its own different sub block address.
>
> changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- re arrange sc8280xp_dsc[]
>
> changes in v4:
> -- fix checkpatch warning

Two entries for v4?

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 ++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 +++++++++++++++++++++-
>  6 files changed, 89 insertions(+), 1 deletion(-)
>

-- 
With best wishes
Dmitry
