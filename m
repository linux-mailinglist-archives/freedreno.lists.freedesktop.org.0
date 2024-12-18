Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484809F6526
	for <lists+freedreno@lfdr.de>; Wed, 18 Dec 2024 12:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2922F10E02A;
	Wed, 18 Dec 2024 11:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yjRsJXZa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57EE10E02A
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 11:44:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so6552516e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 03:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734522254; x=1735127054; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qSgyFmNiySJi9cKbnTzSvCSa7bOHhr/DX1wpZmOFD6I=;
 b=yjRsJXZaPSz4ifyKdpootIxXkRALoFva/BLd2H5XiBUk+xewsGP47PP13u0PDkGnbO
 sCBrDkuOyB44KFj9O09t1XMA24TdvyheW/OU3S2P0cyOpGPe0jZOgvbAAK71PQV0dGvQ
 ETE+v+ERBE7sVxiJ0BTfylCXPeKMZ/amWseJAXj+xNPkHm9kBGOlMf8djtY34OgaKq58
 uJB0D8YefnxkzFHWFnrXBkYRFln1w8wvWBi9whP+yn+WqbOHBwom+/Seo9W4DroxK0PZ
 xP6fGUXHLsvKDLRrKlZIvlxcxdmM2vV3I4VwFOWYNtUssb4NN8sOOW2yLLE0O/pZejPd
 G7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522254; x=1735127054;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qSgyFmNiySJi9cKbnTzSvCSa7bOHhr/DX1wpZmOFD6I=;
 b=bP+PakB4EbC8t8cZEu+wVPxLX0noG+7Qac3ylppmKgzuHKfugRSDv0ACyUAwmJ1ZFH
 opIYf2G15K/7Jjakkbg41rSlYLcYzUI+SyosG65vqiW7QFJmVEBb2DMFTXq5gYi7HFG2
 l5aevi4UJTtvBv/57pG90sUl7acCiP++VO/esjhWUx2/kcJ01PS9JZXFQpPGLk0guc2S
 npBHZh7E+5Yjc5ifqyMTeDBO9TfNcMW+NBRXaorq6PEV2GB933B+wcXSjI84/ejrMybQ
 ei1OPBUr/x/7x0QPhnR4Dk/WteGrBXFDi1dA8EO57hSjzvx1/f2qKCsbJo//QHC6jUsZ
 HMYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJQex3GYieAb3GY1oLM2mvu4kVsQ2GqCOBklvKgxxd7ZlUZqtpcmNMAxvsnCYkUqzbXuGULMLz50M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkR++gr4jwRo1SVH1uMXQMrX1iJKgI1gA+zZeslfBFX2/tLfkb
 LaYEqGAbdyQD3uPVvlTb+OaBzy7j4gtju73oU5qqSenZ5DJRoE5/t5GF2DuLs6Q=
X-Gm-Gg: ASbGncv+pKeO8SUbmesYNcznbYM2XijvAsnOTo4KgUjAsC3ZY71zvkBWPhRBCAKVzCH
 y1a5jQhO3hu5zEC8Vc8V19T3foVk7MgxBIVYAQtds86wrq/294spjtKzK4do/rotlTZnmjsyt8D
 SD6VCvvYeYv9Dzvl1gLlZWdMlMYbJppnjypOg6oUtMZUrNgVqSXX2j6BZtAeBpHsvnQMmhTBsMN
 OSE+EzUz8gPYfMAYBYELzvCAdVHAJCbOo5ozuO9abNa+LHkk3HdbBm4ok1ny1ttxsye9v2w0KkN
 qNTgVfZRZh+RcHUjJVr/Qy2vZLUcjxoHg6k2
X-Google-Smtp-Source: AGHT+IFOi3R771oIo+m0pKp+iNRn3sNMW4xr+wpxXaN11mWnrJ8W+5ljdDjN5QfOFxC9hMEiYHevEQ==
X-Received: by 2002:a05:6512:2212:b0:53e:395c:6888 with SMTP id
 2adb3069b0e04-541f46c442dmr1008761e87.36.1734522254000; 
 Wed, 18 Dec 2024 03:44:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c002fcsm1378275e87.127.2024.12.18.03.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:44:13 -0800 (PST)
Date: Wed, 18 Dec 2024 13:44:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <bwnsxcimgl7oqnzhrxurn3gs2ea3r6n4o5fulyhpooqnzbjllb@t7nljbwf3t3n>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-9-2d875a67602d@quicinc.com>
 <cfdyvcxdkmf4sv5f75koflayyx74wd3tuscdl7byp5peaag5ty@yhr3275jhftn>
 <92b6335e-a303-49d3-9b77-f951663fc10c@quicinc.com>
 <CAA8EJpqyM-r3jvY7sTpG-KKRHP9K7c3q0xfoLb_f0th7vunPYw@mail.gmail.com>
 <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baab6fc5-755a-4675-a42d-ba7ba7facf0c@quicinc.com>
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

On Wed, Dec 18, 2024 at 11:18:01AM +0800, fange zhang wrote:
> 
> 
> On 2024/12/13 18:19, Dmitry Baryshkov wrote:
> > On Fri, 13 Dec 2024 at 11:21, fange zhang <quic_fangez@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 2024/12/10 19:02, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 10, 2024 at 02:54:00PM +0800, Fange Zhang wrote:

> > > > 
> > > > > +            i2c@0 {
> > > > > +                    reg = <0>;
> > > > > +                    #address-cells = <1>;
> > > > > +                    #size-cells = <0>;
> > > > > +
> > > > > +                    anx7625@58 {
> > > > > +                            compatible = "analogix,anx7625";
> > > > > +                            reg = <0x58>;
> > > > > +                            interrupt-parent = <&ioexp>;
> > > > > +                            interrupts = <0 0>;
> > > will change it to interrupts-extended in next patch
> > > -               interrupt-parent = <&ioexp>;
> > > -               interrupts = <0 0>;
> > > +               interrupts-extended = <&ioexp 0 IRQ_TYPE_NONE>;
> > 
> > Yes, much better. BTW: are you sure that it's really IRQ_TYPE_NONE?
> We extensively tested FALLING and BOTH type, and they all work. However, I
> believe it’s better to use the default type, which is the same as the
> downstream approach. This way, it will be more stable.

Following downstream is a lame reason. Downstream kernels are frequently
wrong in many ways. So please check the actual documentation for ANX7625
and specify correct interrupt type.

-- 
With best wishes
Dmitry
