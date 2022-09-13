Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46565B6D74
	for <lists+freedreno@lfdr.de>; Tue, 13 Sep 2022 14:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39710E6EA;
	Tue, 13 Sep 2022 12:42:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B2510E6EB
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 12:42:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id w16so11821706eji.9
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
 b=fKbUU7RNxlQl+VA9rK9x6fuo4I5OHpjbBX6iooSmH8j2dhxcAOmNSE8zqOmavODS+m
 LuxcXt3P9JkKEwEVC1MiOt78KIlqAKdBtMugt8WZ8+Zhu/nr/u+MJoeUAV0iQdju4EET
 zR91JVo8I8Tz+zapJ5jTBrH5mexNnTqVyfEsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sbb0BJfxSJ0bvHV5wkGwxNNxQE++mNh72PtFxZYdbyw=;
 b=dTqIOjE3nWtuMQ/6Gmzary4Jl0efg+nQnJz9UXK0lo2yI4OhkwHKrL+K1LIBQpJE1T
 YyM/ygbyRPEhMMrZlMqFo2Bv2P8nMx+G/hzbK/ROYH9FWugJkYijfkOvZuwEwBdDY+gE
 o/+LIoiSa1GVs3VtTzhlr6xrFq9LwcDymaLb6guT/72WhmhSkn7ucC8KwxWVF+Lhtq9S
 gtpov5b8QYsEQ4iBPxJRJtBNFqk4HRMyTNFh1jjZLbk7KSi5S5mfIXRvSFgD9Ve0FTWD
 VFQQqO5etQCskwXW0SAGI/gcr5NcrKfsIf7mvRre+wCu+5AlWp1PpyrF5k7P4ins91eM
 J64Q==
X-Gm-Message-State: ACgBeo0rOubshOsvtsewJUbWInaOKvoteix52QhpmBKcnT1L8F1oVB5S
 di2XrX/XBOc9rpM8HFPtFMLRygsRmlAWIDjud74=
X-Google-Smtp-Source: AA6agR5JtqWHqTb6Q8tECTmrCgYQRuWi86yvs238EI0yizp55BBy6p6lF2mvlWxBFPrpWhyQeEcbCw==
X-Received: by 2002:a17:907:2e02:b0:77b:bdab:674b with SMTP id
 ig2-20020a1709072e0200b0077bbdab674bmr9502691ejc.159.1663072973895; 
 Tue, 13 Sep 2022 05:42:53 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056402138a00b0044625884285sm7801174edv.49.2022.09.13.05.42.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 05:42:53 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso9441258wmq.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Sep 2022 05:42:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr2359963wmq.85.1663072581167; Tue, 13
 Sep 2022 05:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-7-johan+linaro@kernel.org>
In-Reply-To: <20220913085320.8577-7-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Sep 2022 13:36:09 +0100
X-Gmail-Original-Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
Message-ID: <CAD=FV=XXCOgRwdsHxnH5DhoNb5QAT6n9m8iUNOQ5at4YAKd-cw@mail.gmail.com>
To: Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 06/10] drm/msm/dp: fix aux-bus EP lifetime
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "# 4.0+" <stable@vger.kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 13, 2022 at 9:58 AM Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Device-managed resources allocated post component bind must be tied to
> the lifetime of the aggregate DRM device or they will not necessarily be
> released when binding of the aggregate device is deferred.
>
> This can lead resource leaks or failure to bind the aggregate device
> when binding is later retried and a second attempt to allocate the
> resources is made.
>
> For the DP aux-bus, an attempt to populate the bus a second time will
> simply fail ("DP AUX EP device already populated").
>
> Fix this by tying the lifetime of the EP device to the DRM device rather
> than DP controller platform device.
>
> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
> Cc: stable@vger.kernel.org      # 5.19
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

This seems fine to me as a short term fix until we get the DP AUX
populating moved to probe.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
