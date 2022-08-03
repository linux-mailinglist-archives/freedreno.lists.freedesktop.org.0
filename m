Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A11C588DE0
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 15:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BA518B8FE;
	Wed,  3 Aug 2022 13:51:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1DC10FC3D
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 13:50:55 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id tl27so13747341ejc.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
 b=OPbC8bWfgzWIie1MfD0jyh6gObqMl3sUtChiIWlKH1yMV8iPxv4ElTDcA/PzHNegar
 6Q0saDylV3e1iDeJ1byjBXOSyeKWMBGjWYRa5oQbwaeiE8Z2F7rmGUHCGcWI70WcGI+X
 +jYxrmH6tmuZkcUvlnKf2JFiqxRcT748c8QQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JobmQomHLtYAJ+DDomxdN8Lk7HYy1OLd4rHEITgLQdA=;
 b=qEXBwtpUHfIN37H/wQaWQWizc6Jtz+kr54OyWKzomqfQIXE1DhAzBevjQUKwGXh1qT
 d62wNjnfUHVMGYGkuiVkG0ta5uLJrTAL8rg44P0mMxD5eV0rQ9kof/4EZbNwkio+l/Iu
 ViLj1ciq8PIcjvDTRXbO+bkE21gtBLegPWh0MfCTY1FwDZsE0nSPiYBraNX88TVwkAQD
 pkmtLG23mYjVVr/l6ddPwlgK3qHRtIcXOpBB9/15Gbw6aZmIk8UjTH9J7nQWV9WqH4qI
 Woob7xb4mJIBSog4WnL9Gw2xLJ/GdksIT9VNNl9bvqsqUzX41uaTvkHvf6i1pMaBVJww
 51kg==
X-Gm-Message-State: ACgBeo3PVs+ObJ3FEu+E5pZmIYnpkedhk1nbhsujIhxsT61gKz9eA3+j
 bIWq0OMikFckVAt9uV+uQHBuWbvng1T6iJNy
X-Google-Smtp-Source: AA6agR4DlhWW5G4lcyhBKQFb7Pd1uavNgzn/vOy5blQSlu1fjb4dH2DFDvyoltAWFcdMIODpeFcCvg==
X-Received: by 2002:a17:907:2d23:b0:730:acf0:4907 with SMTP id
 gs35-20020a1709072d2300b00730acf04907mr3129864ejc.700.1659534653630; 
 Wed, 03 Aug 2022 06:50:53 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 ec15-20020a0564020d4f00b0043c83ac66e3sm9462346edb.92.2022.08.03.06.50.48
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 06:50:50 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id h13so2404430wrf.6
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 06:50:48 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr16303940wrr.583.1659534647816; Wed, 03
 Aug 2022 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.4.I7b3c72949883846badb073cfeae985c55239da1d@changeid>
 <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
In-Reply-To: <232f875a-4986-300a-f1e8-18f2da3a8fc6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Aug 2022 06:50:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
Message-ID: <CAD=FV=XWxMis61zouPeAoTUC6xYz7rSUC33wdvyLii0Cd2j4Ww@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 4/6] drm/msm/dsi: Use the new regulator
 bulk feature to specify the load
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 3, 2022 at 12:12 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 03/08/2022 01:37, Douglas Anderson wrote:
> > As of commit 6eabfc018e8d ("regulator: core: Allow specifying an
> > initial load w/ the bulk API") we can now specify the initial load in
> > the bulk data rather than having to manually call regulator_set_load()
> > on each regulator. Let's use it.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> It might have been better, if the previous patch had only removed the
> load_setting on disable and inlined the dsi_host_regulator_disable().
> Then this patch would drop the regulator_set_load() from
> dsi_host_regulator_enable() path and inline it. Then it would have been
> more obvious that after these two changes the time when we set loads is
> not changed.

Seems like I should post a v4 to update the commit message of the
final patch in the series, but I'm going to leave this the way it is
since the end result is the same. Originally when I wrote the series I
didn't know if the new regulator API changes would be accepted, so the
previous patch did the most cleanup it could do with the old API. ;-)

-Doug
