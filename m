Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FF240360E
	for <lists+freedreno@lfdr.de>; Wed,  8 Sep 2021 10:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839596E154;
	Wed,  8 Sep 2021 08:26:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350146E157
 for <freedreno@lists.freedesktop.org>; Wed,  8 Sep 2021 08:26:02 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t35so1159289qtc.6
 for <freedreno@lists.freedesktop.org>; Wed, 08 Sep 2021 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I2GYoAF05W4QlTQNUCm2X4ED9hxXNWtrDyXhLShUptk=;
 b=e7g/IsbTln55dVeqTe5gmEnqabfSh7kHTb727uLUnyovBvkSGw8go8jXg95jjjF7tX
 R3bxp8omNg2Es3zR/CXIfV9ZMzXzQv+UEh4eSsWJkGl23Kssli7oOmRZQy9Pkaz7gEQy
 T44E5FFPOfRGx0HrA7fHZ6ZY2+IQ+KdzAvmJAeRJMA//xqk3Km7DEs34HVTG8+rE4tdi
 Nbz5dPeEyxoWv4I3QLfTHj1lYqM5Pp+pZfwjb075mSYqkvPbTo02Io6Avm0Rim4MyC0R
 4CYSQPxj0VXCNf6T7mcbGmua46gZ5pVoJTpvZBN/cJg4xb18jQYmvSm3Laik4qD63ecW
 Eo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I2GYoAF05W4QlTQNUCm2X4ED9hxXNWtrDyXhLShUptk=;
 b=luJsWI8b2gTf/4mD2BEsgmU465E57CCrm5ARn6nE/k3AOjeBpP+t+Hf67+aYJiIKpe
 q2HZ4CSxy83zw9v//veb/a49eSHkxboSwlF0BsOxISRD9GSbK2Ybkkgzk9muirPszF+V
 hcF35tCRnu2KFZUJZmGUH/JMquu/cqzUksRE5JFy9G1IX6rCuJ5Xl1yZxCSBKSRvxWw/
 prY5Tw4bw22WlcdltxLfyfbXz3Gn/OzfLKXvmkCTzBQ5UdNEmpfN2ncb3y0ooMz5Lm0r
 N/vxucdNvO1MYPPXqED07lpmR8+GRRx5muVgV+QKc84dwB1jnj3NrO8Ti6GIQLxpACBj
 6Clg==
X-Gm-Message-State: AOAM532pc3BA2gJP1//PO4hUmBVRhULJFRZY6z5IFcdDtsloKDGkE+5x
 4JFtgc4XPHVlpyD3QZn4o3MuAQXrrvhisYRMuntHiw==
X-Google-Smtp-Source: ABdhPJxJhjzUMRnWrBQrlHB5E1FH9Zjc6focYT3nA4MBbnlIPOsA5Rm9xuH5jYYfBZrGvUDOGlMTALwyLQ7v5Mh8YaQ=
X-Received: by 2002:ac8:578e:: with SMTP id v14mr2471269qta.285.1631089561173; 
 Wed, 08 Sep 2021 01:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
In-Reply-To: <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Sep 2021 11:25:50 +0300
Message-ID: <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Rob Herring <robh+dt@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> >
> > Bringup functionality for MSM8998 in the DPU, driver which is mostly
> > the same as SDM845 (just a few variations).
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>
> I don't seem to see a cover letter for this series.
>
> Eh, there are a fair number of differences between the MDSS versions
> for 8998 and 845.
>
> Probably a bigger question, why extend the DPU driver for 8998, when
> the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
> dumb, but I don't see a valid reason for both drivers supporting the
> same target/display revision.  IMO, if you want this support in DPU,
> remove it from MDP5.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785

I don't think that we should enforce such requirements. Having support
both in MDP5 and DPU would allow one to compare those two drivers,
performance, features, etc.
It might be that all MDP5-supported hardware would be also supported
by DPU, thus allowing us to remove the former driver. But until that
time I'd suggest leaving support in place.

-- 
With best wishes
Dmitry
