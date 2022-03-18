Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 809B44DD197
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C8D10E8D4;
	Fri, 18 Mar 2022 00:04:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE9689D5E
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:04:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b15so8466541edn.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
 b=EFcmlZxQVZdmxurMBWghVQOI5rZtJ0CxcvzDKkyvCNRIWyFwEOG91za76YnKwGchla
 Xi1Ive9X2CNoEOSbIUFvrIcLnuG6Q+OgBvCxMMKcrkX44zbHB52V5RMw7092LSlqV/aZ
 uYlseCKaHPm8mppiKMXEDwWCFGJNFOGF5bHgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UsWfL2d3buCfR66QbOAjKWSr57IypHJxBiVAhmGi4M=;
 b=Ui1CLjQYVtbJOmWB7z4nXRAvBYWLl+1q+RZzi++zL8he5VPDOeWIUavVpR8jNT7smu
 zRp3Z4+Cq7IexXXz38YTH+4OjO0aMa0qQkU6WG4t4D1LKmbmMG5RFiWl7l9XDj/9L7/L
 qkk8tRNw18OjfT6JWKlqiGozotSQHr5Rpu97P2DDtmYkh68EVf/zsQmWjGdQvYLv5lua
 xqVvySaBXN2NgirL67fkWMWeiNl1efyAOgG7dNeGCtZWEqbwiTC1WyWuz7q9dAgspru4
 W4t3TimruivTK7nhUmnaaEKR/r2NTeLGfTV11dQmUi0fr2VsxWfVMCMtBOapre7WUfnR
 OSHA==
X-Gm-Message-State: AOAM531fN8db2l9laJ/7OO8Y+suHQR6KEPbIgNMtAbjlA4A4AOiRnokA
 O05qlj3w1eXWSQnNzo0C/eR2upyHwI2IZw==
X-Google-Smtp-Source: ABdhPJzWI6ERa6/6aXBS/IJerpTmXdpPfQwEgMr9dKPksBNQhhBFneJcyd9s1ImULP6XQ6Xypcvdvg==
X-Received: by 2002:aa7:c6d3:0:b0:418:eebd:8760 with SMTP id
 b19-20020aa7c6d3000000b00418eebd8760mr7192647eds.50.1647561858148; 
 Thu, 17 Mar 2022 17:04:18 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906354800b006da9dec91f2sm3006286eja.163.2022.03.17.17.04.17
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id h15so9622108wrc.6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:04:17 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3705265wrw.422.1647561857230; Thu, 17
 Mar 2022 17:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:04:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
Message-ID: <CAD=FV=XUfQoYO-=BPvH4o3EWReCVckfCThYxf==T2Ff_C8TrQQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 4/9] drm/panel-edp: add LQ140M1JW46 edp
 panel entry
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:37 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Add panel identification entry for the sharp LQ140M1JW46 eDP panel
> with power sequencing delay information.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This is trivial and going through a different tree than everything
else, so I'm just pushing it to drm-misc-next (which is setup to land
things without regard to the merge window) without sitting on it.

You can leave it out of future spins of this series.

9f493fd71d4b drm/panel-edp: add LQ140M1JW46 edp panel entry
