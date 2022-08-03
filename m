Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79175588E00
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 15:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8899518BF6C;
	Wed,  3 Aug 2022 13:55:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7C518BE21
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 13:55:16 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id tk8so31608327ejc.7
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=BX0MHXFB9OMLas/3vw1gWSW/wKlLfG1bTlBU7/A5LJY=;
 b=NgWFEGgqhpFOMAezMzzFaK7vGV+stSnIqJjbdEM3QqRLao4HHCRJ6LwcqWOcDrMmwd
 a0gNzN/9aGOGsFxsbpAEiMb/bknSNrVfjlM3GIgVJFuSpLQlFbJO+zEKTxBYLvzDzmfr
 yJdg+x5hmAYuyctBRyTquSAt7q/6fDMtx20is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BX0MHXFB9OMLas/3vw1gWSW/wKlLfG1bTlBU7/A5LJY=;
 b=1N3TLd5+RcZlgRjiInmcerBJbVIzFna12vjcROPMiRa9l1FXCJx7KDENOqggg+XNn6
 x9+kRtS2+ADLaCABS7N7f/UsS3VYrtT+LL15T8GklhDD57hugS1bh1ZvUbu5HSxskazI
 yoCdB3xv5HP5Jx2Erfsk+xq+TaW+k4AcAWy7MQBWFtirg0tmbiBixhPRREOvCbvTIwRC
 2HxYXyWqgYehpvenhZcz3FWwT4jUvUv6KGrLeQ365MfEh3B01f6BmFlQB7TyH2nKemUt
 TvP1K3r2aJgQHhv81Dvl8sxnEwpzL6seXAxXeDbVaK96HVwrRpiUdTxbc/OwvTSo7ZmC
 wVSg==
X-Gm-Message-State: ACgBeo3frPBio1mMuITkrwekaZkbQYtquOZONR3Zw/QquoVJl2EB9VR/
 gL1I6u6MAyio/dm4Vbwrc5m5ZBSbUp99tDiu
X-Google-Smtp-Source: AA6agR4UHyL6NOP4RHD9WDOhU4ZyO9iKaoa2c1EzhpQ0gTQOeXBj7bIiPbJMQhIPs+1xqndsayikSA==
X-Received: by 2002:a17:907:60c8:b0:730:9efe:ecbd with SMTP id
 hv8-20020a17090760c800b007309efeecbdmr6476971ejc.90.1659534915085; 
 Wed, 03 Aug 2022 06:55:15 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 j1-20020a17090623e100b0072b8222c7f7sm7325779ejg.33.2022.08.03.06.55.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 06:55:12 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id j1so13307341wrw.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 06:55:11 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr15858645wrf.659.1659534911179; Wed, 03
 Aug 2022 06:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.6.I969118a35934a0e5007fe4f80e3e28e9c0b7602a@changeid>
 <3f79c5b1-9ce8-6aeb-300a-565ba018ae11@linaro.org>
In-Reply-To: <3f79c5b1-9ce8-6aeb-300a-565ba018ae11@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:54:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVSBvpAs4bBHTh6tGXazU1+OLg4+Opfg8guXQ1ShhnNA@mail.gmail.com>
Message-ID: <CAD=FV=UVSBvpAs4bBHTh6tGXazU1+OLg4+Opfg8guXQ1ShhnNA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 6/6] drm/msm/dsi: Improve
 dsi_phy_driver_probe() probe error handling
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:32 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > @@ -634,88 +631,71 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
> >               phy->cphy_mode = (phy_type == PHY_TYPE_CPHY);
> >
> >       phy->base = msm_ioremap_size(pdev, "dsi_phy", &phy->base_size);
> > -     if (IS_ERR(phy->base)) {
> > -             DRM_DEV_ERROR(dev, "%s: failed to map phy base\n", __func__);
> > -             ret = -ENOMEM;
>
> Here (and in a few cases later) this changes the error code from crafted
> -ENOMEM to the proper one returned by msm_ioremap_size(). This should be
> mentioned in the commit message.

Good point. Unless something comes up I'll plan to spin a v4 with this
change to the commit message tomorrow.

-Doug
