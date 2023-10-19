Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E167CFA55
	for <lists+freedreno@lfdr.de>; Thu, 19 Oct 2023 15:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBBF10E4D2;
	Thu, 19 Oct 2023 13:05:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5215610E4D5
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 13:05:14 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a7cc03dee5so97407677b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Oct 2023 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697720713; x=1698325513; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
 b=kG5TiYg8HosUSuTaRJov2e7no8m5DaBXjFoWXojO5EX2CC7XNslwz6YZEl+LnSDIlZ
 vD4PzFJHgxh6VYy/nBQCEn7kj3OupPbWSr4GVHbDL9uXulp65MtYVXF3U71fSmPgovVI
 UILdDK9EGaQR0ff5bSrq7zM6D76R4HaYMhO7ihbyHTq1ZEDbu4uTVWnS097RsL4p9JRW
 zy7U0AWVKHaJVErsaFHdqApgwu1p8Ojd810wMsFGSwwxCvp9j2eALKOagjCXmK5LjGZC
 koGyxZsGoD9SATjni/YKeTF3iroigiTLyFcsyQzZQ13G3WumIKW3WpYNNRpn499di+p4
 6odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697720713; x=1698325513;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbM+qQUNE2weQ5cnzFLT1Qc6XFwhF5OSMBSFH1UxmMI=;
 b=TdEvm+tpkvxmAjtYLRfe3tmbP89SxWnXmlwVZkxXdyO5X4O7xO9gz0ybJom3ZW3yMw
 FoghtsQsj9XhA1yenHszv1hUdu7HhXzxsdOqkCp02G0dvMAI2kv6UL6KqaCf6F6wkp1O
 9B16crj1FUvYuE5DigWmE4JLgrpSZ5UXa/CA8vGkAcn+RFEFhdvlQtn+HlyIgArY34Od
 T3468/1I9rJ688n+j6zB4Pc4WOYZbiy//2eZnTgxqeEPwEIlOIyQfqBd2DL3oBGl076V
 RObRDb+SqyOAccYhQW13yAACYTo1c2FqlN0qr51DzF77rF30XpyEP0IQ75Y3+KPX4SYQ
 AKfQ==
X-Gm-Message-State: AOJu0Yx4O70BYOmcBW3UusTx0AGrzm8WqRlAPhmv4RG7cRNug8My2fCq
 XWN2Pxsyc0t2JDUiK5x/QYmzO4WO3/QEc+BSMAKIqA==
X-Google-Smtp-Source: AGHT+IFdSX1HpPsh0RDrBsVBXf68icjGXwoNe/l4tlQ0yV1+tnNZAErnPCdVrGpNL24iHTDqyWLASjGL0KKSf4YU4UQ=
X-Received: by 2002:a05:690c:f01:b0:5a7:f002:4fe4 with SMTP id
 dc1-20020a05690c0f0100b005a7f0024fe4mr2703160ywb.23.1697720713175; Thu, 19
 Oct 2023 06:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231019104419.1032329-1-dmitry.baryshkov@linaro.org>
 <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
In-Reply-To: <1ca930a4-60fe-a867-f676-0b79682982c2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Oct 2023 16:05:02 +0300
Message-ID: <CAA8EJpqE6b4qi0vaV-gypCwyVHwDibC+rVB5SgBvK58cyU9uzw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: cleanup debugfs handling
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 19 Oct 2023 at 15:33, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/19/2023 3:44 AM, Dmitry Baryshkov wrote:
> > Currently there are two subdirs for DP debugfs files, e.g. DP-1, created
> > by the drm core for the connector, and the msm_dp-DP-1, created by the
> > DP driver itself. Merge those two, so that there are no extraneous
> > connector-related subdirs.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
>
> One concern with this is, we are migrating from one debugfs per
> dp_display to one debugfs per bridge.
>
> Today we create one bridge per dp_display so its fine.
>
> With MST, I am unsure if there will be changes needed.

For MST the add_connector callback creates a new connector with its
own implementation of  drm_connector_funcs. So if necessary we can
create debugfs files for this new connector.

> But, we will figure that out once we add that support,
>
> Hence,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
