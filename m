Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD27445AC
	for <lists+freedreno@lfdr.de>; Sat,  1 Jul 2023 02:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C3010E50D;
	Sat,  1 Jul 2023 00:44:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E99E10E50C
 for <freedreno@lists.freedesktop.org>; Sat,  1 Jul 2023 00:44:54 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bff27026cb0so2421351276.1
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 17:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688172293; x=1690764293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rb4XLbAa6FHa6f/bZHMtFsSM9z+lq4odMd6vK4N6U0A=;
 b=HDDOAVVxZmS9WBogOomJ5KhF8WCVKZYzgS9XGBT2dQOaIuUgD99wuLx12AAMrGrtX5
 CidFk3nKSiYbOOsDoQx3IqW2Ozwk9XWwrjDieUdobowWMzeA7xNVlbvV9/OFVbKJgerR
 aBUAskHi397/8ji2BnJ2A6Og6EF7DNNA2Ci7HbDj/GAXC3GloWQC4XXzqqg+RCSR+QNj
 v2kqQJIkTbESJnODAF5p9AnbtStKLO2V22a/AYwl/RmPpBJ5zNrQpFu2A5h/ZXk3Gxdx
 PfMB/YRwJk6RK+CLb4CQ6Ne34XRqVMOUi/viER6K9lKi+xzvO25xdsbtkI5Ef4VsGBQN
 QnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688172293; x=1690764293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rb4XLbAa6FHa6f/bZHMtFsSM9z+lq4odMd6vK4N6U0A=;
 b=i6lrzunCr/JelNwXJ7UMp+LamYbAcU0M75KpMNdJ1spQcaG8xXs2xh2GuKJk1z4wxa
 Ssvxnw3PtotXQ+zIKJcP+XlbqAgrn7YIxoH447/SsDEP1zQhUT5yyi0QFd+VF0OBmS+J
 Nx3nr7+MaKV/qt6vg8n5Ic8dso/3nXNMCuUH/AEHQp5drXC0P8R2Tu9umfyvIKIqMWxF
 SR0jzELApQgV4II9C2Q2h3yufuPzcd2mAIU/++jBt+KAMJVRas7vm1mUVaficAYmKuB7
 2NVyXyZsNzaVxAgyseMty0hobx6czhjSwNUpjXwf1YU7237D1++xT6gQJzVmgVrApuQG
 +7HQ==
X-Gm-Message-State: ABy/qLY//rZOhitmUsIoPX9TsHcaXu69YrfuMBBfJD7BTrvHfbUNlL/4
 ZcRC4klpaYYz/pEdw9x8FZY6hqkC9AYyLwYQvUgsCA==
X-Google-Smtp-Source: APBJJlEL+WwVjxtvdk5GmlBVWtrIkQtRgNljiIk574SW1j79w6jqxyJYHfbUxzZsbWxrQV7bdXvEgAqaCpDsU8DP4VI=
X-Received: by 2002:a25:2449:0:b0:c28:bcc1:4834 with SMTP id
 k70-20020a252449000000b00c28bcc14834mr3301600ybk.30.1688172293164; Fri, 30
 Jun 2023 17:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
In-Reply-To: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 1 Jul 2023 03:44:41 +0300
Message-ID: <CAA8EJprYvLXaGmpYaSBt9eW5H1Ec_BKeCLW1qp1FvvR1LpDf6g@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/adreno: Assign revn to A635
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 1 Jul 2023 at 02:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635). Fill it in as a stopgap solution for
> -fixes.
>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

As the v1:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Changes in v2:
> - add fixes
> - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e09c08fb@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb94cfd137a8..8ea7eae9fc52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
>                 .address_space_size = SZ_16G,
>         }, {
>                 .rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +               .revn = 635,
>                 .fw = {
>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>                         [ADRENO_FW_GMU] = "a660_gmu.bin",
>
> ---
> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> change-id: 20230628-topic-a635-1b3c2c987417
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>


-- 
With best wishes
Dmitry
