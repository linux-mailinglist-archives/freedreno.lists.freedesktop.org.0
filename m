Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0A64482F
	for <lists+freedreno@lfdr.de>; Tue,  6 Dec 2022 16:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADCC10E124;
	Tue,  6 Dec 2022 15:40:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B392210E05A
 for <freedreno@lists.freedesktop.org>; Tue,  6 Dec 2022 15:40:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bj12so7091673ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 07:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
 b=kLrPEpykbsLXwkED/QlJ1FLFFvX9oUCpMJKPH4x0GiU8byIpo6HmWG9Xl4xlk8maqA
 aKCRmP7kd8Dz9IRbEOKS5YbYuuxkhhJl9Q5sjHr0iuB9l2Et/XZi1FDpz4I54nt6Dtg4
 Xp+7QF9vE9mokQorQF9Rn7+Mt/gaqnt96+GEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQDzBqsBTE8WLwYAzMMGHQmUn+CuZZVkF9Y36XFfYec=;
 b=fihmcxNu4LXi8k8B6/+X0YvRQrrJF/M66CpReUufWsA08+BvSJlJVs1rc1Ky+2rATL
 CP5uYEeyWJ16Zh4rcns3G/8Skwg+X1p2tZ/lmn+nO3Dkz/myo1ZDLz6rGFMNCqnsBjsF
 fLCc7TT0Ss5ej6EzEA/HJyi5ebL4EIAHhegGBQSbpO13Q45xnR0tlMOya2VSCzCVXFUZ
 +TuBB/AdmKvgUxgGVxIjlVN9dTbAbPacemG9m6kxyGNDugbCcMB9K/s29JVR6RjjPEPu
 YhKKnL8cSWpsKMcx26QSR5qZpG8TMtOfyXthk7P8uhOGQZI/hfd/W4EbcrJs4Pyxm6H2
 VzoQ==
X-Gm-Message-State: ANoB5pmuIwAn6EwkFCIzxaiUrIirHq98cyWQnjvzLiZHepJvWpGifmEu
 MP5jlga/jvfDPqTxGnjHRxBjmE50e2DITsQflds=
X-Google-Smtp-Source: AA0mqf44VS0OY11ge25gBpUa0vHmMMxzeIuDTEHrnzWw4UKvNbqHd4EUaYUBqXJlwXdTs6ADZeP7OA==
X-Received: by 2002:a17:906:c18f:b0:7c0:b604:9ee3 with SMTP id
 g15-20020a170906c18f00b007c0b6049ee3mr156518ejz.68.1670341249132; 
 Tue, 06 Dec 2022 07:40:49 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 i5-20020aa7c705000000b00463a83ce063sm1086060edq.96.2022.12.06.07.40.46
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 07:40:47 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 m4-20020a05600c3b0400b003d1cb516ce0so903076wms.4
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 07:40:46 -0800 (PST)
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
 bg14-20020a05600c3c8e00b003d069f4d3d0mr23096034wmb.93.1670341245678; Tue, 06
 Dec 2022 07:40:45 -0800 (PST)
MIME-Version: 1.0
References: <20221206075512.812389-1-linmq006@gmail.com>
In-Reply-To: <20221206075512.812389-1-linmq006@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Dec 2022 07:40:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
Message-ID: <CAD=FV=XXoue_vkuM7TmxnECfT3-p9d-OH=H_dyeoOk_Kp4kK2w@mail.gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 5, 2022 at 11:55 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_icc_get() alloc resources for path1, we should release it when not
> need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
> Add icc_put(path1) in the error path to fix this.
>
> Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..a38fa9a9a3d6 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -49,8 +49,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>         struct icc_path *path0 = of_icc_get(dev, "mdp0-mem");
>         struct icc_path *path1 = of_icc_get(dev, "mdp1-mem");
>
> -       if (IS_ERR_OR_NULL(path0))
> +       if (IS_ERR_OR_NULL(path0)) {
> +               icc_put(path1);
>                 return PTR_ERR_OR_ZERO(path0);
> +       }
>
>         msm_mdss->path[0] = path0;
>         msm_mdss->num_paths = 1;

Hmmm. I guess the original author of the code (which wasn't me--I just
restored the code that was deleted by a previous change) was assuming
that if mdp0-mem had a problem that mdp1-mem would also have a
problem. That would mean that you wouldn't need to call icc_put() on
it.

...and, in fact, your patch doesn't handle that case, does it? If
_both_ of the two are error or NULL then you'll be calling icc_put()
on something invalid. I guess icc_put() handles those cases without
crashing but it will give a WARN_ON() splat if it happens to be an
error...

Really, there's a better solution anyway. Instead, you should do:

path0 = of_icc_get(dev, "mdp0-mem");
if (IS_ERR_OR_NULL(path0))
  return PTR_ERR_OR_ZERO(path0);

msm_mdss->path[0] = path0;
msm_mdss->num_paths = 1;

path1 = of_icc_get(dev, "mdp1-mem");
if (!IS_ERR_OR_NULL(path1)) {
 ...
}

In other words just defer getting path1 until after you've checked
path0 for an error.

-Doug
