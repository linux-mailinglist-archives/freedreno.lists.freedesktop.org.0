Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C5567800C
	for <lists+freedreno@lfdr.de>; Mon, 23 Jan 2023 16:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EEB10E4D7;
	Mon, 23 Jan 2023 15:38:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDDC10E4D1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 15:38:41 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id q130so5743067iod.4
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
 b=Q3dQNfOIsBKbEssAr8S/0j2BHEXhzLeK6qqTwjbGFlMNtkbm96lJaHLBbeZdqOLHIN
 jqv9DLB/SnYamc6sLj/eI0xT3q+9bPStpYW/Xa0XZzY6uaYxxy8c+5ohJwrCBHoi8K2/
 mNe/DClGW0oO4B+xbmmD3rwMhPieMBk9avVZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTMdUYoB31JTLCUSgm3VtLqQhozltwVtxsd9chRjQsA=;
 b=jnVi1IvBUzjbiN7Its49fRPwo6spscTd7j46de9x+XPauiAUTiraxx9QKnfhoegVMI
 J9ArZhloG2mcLj1r09W5o74hH6LZhq2ZL7eiD/9ExE+FI/J0HdBJm1craGCWCI8r9kGb
 WnDwt1vaEU72AUxLtTmTacfPhDgiX/54XPZFFASVlr1RQJo8QI2BAwSCYRst/rcl6EjP
 iixVL64ZkoAmsLtSWmNubLnlMwkz+KbRkxRxKgatKHgvsKsXaYCwZpFuciRtaTwpKp6V
 xjzESTnRxX8R33qAhypHxHIweyYqJD2GkIc08rGFvCCfhqgsHfhxeEGrA6RcD7DmjdP8
 9edg==
X-Gm-Message-State: AFqh2kq5ubfOg8vYayf0ykXZw5nBeGBm/8s0vnb8QX6EVw0r3PQ2fNDg
 yB+uMzmJjYa4x3k9oe9LpSXiVMm21d6nU/ZGVzBUHw==
X-Google-Smtp-Source: AMrXdXuXxev/GY8Oy07lOGET6d1ZUhWZ1e8eg082MJK3Aqa3PS4fKCI4WfECJhpMfT04OzR0UvCeatClLncLpOlbbd0=
X-Received: by 2002:a05:6602:1782:b0:6e3:134:3a97 with SMTP id
 y2-20020a056602178200b006e301343a97mr1998187iox.64.1674488320775; Mon, 23 Jan
 2023 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20230110231447.1939101-1-robdclark@gmail.com>
 <20230110231447.1939101-2-robdclark@gmail.com>
 <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
In-Reply-To: <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 23 Jan 2023 07:38:38 -0800
Message-ID: <CAJs_Fx5Wjnxw3rOtu6ye493SO-K+b3WLECYGBSCDUsyQhTjdiA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning
 debugfs
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Chia-I Wu <olvaffe@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 4:38 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 11/01/2023 00:14, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Make the handful of tuning knobs available visible via debugfs.
> >
> > v2: select DEVFREQ_GOV_SIMPLE_ONDEMAND because for some reason
> >     struct devfreq_simple_ondemand_data depends on this
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
>
> For some reason this was merged even though earlier kbuild reported
> build failure. This breaks linux next and qcom defconfig. Please drop
> the patch from the linux next.
>
> See earlier build issues reported:
> https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/
>

This will fix it:  https://patchwork.freedesktop.org/series/113232/

BR,
-R
