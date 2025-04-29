Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50825AA04FE
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 09:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44B110E2E9;
	Tue, 29 Apr 2025 07:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vxNQSkbe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B1710E2E8
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 07:50:59 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so808219566b.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745913058; x=1746517858; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
 b=vxNQSkbeqocM+eKEiRiqAlq1v+PQAPWBphpgXBNKtiVL3qbk2a6eyLTHT6uDus71Re
 oLJeH73aUNqEbt5Ut8hIMg6zcrm1EzOtncbIp7L/ZkLgDHbFhsiLdAq2qvYAwOyNwFPQ
 Jcu0i76DX5/b26XdkEnGvjJLRTtqp4jlefuuQorP6Fobmr5cOk8DIr9tkAu2MelMC4SZ
 az17zeEW+blyuF1LDDsv3ziZv8TeJ2kq000JAhPMOMpdPUEVnULYFiOnBYq3swWTiUVy
 WCpLELQjEazGCCMUJ0+vbsN0RAaUmgF6+aDc7UF+PFd1fevSHN+16u/KufxKIAK4lxLt
 fGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745913058; x=1746517858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4S3OVk3iZS4jTjecVJq5ncwg3Lfwh0WDUheLTONON4I=;
 b=PV3upglixisXpsC+CV5u36agGn95IW9R6Yhr/qAasf4o1uW3dmc7IJuAOtvu1VO5BW
 gsP53rKp10AQmxjdWb0xk9ZvOwxK5dNpMmTKGI65nRucyBFmIkCP4qzxjjg58dUXShVJ
 Lb/AtUS9plmtzqskQkODOr+gcnhw1+ocVuR2R+TMDAzk5GCQVWmiYS/+9TXTlELNss03
 WcHXmI9Q7eyI38RtMzZO1tfoH0u6G8WFwfsvNV2j0TmbZrwoDQgLZD0HW5QlNoz5XTm1
 xpRXb+1E0b+lac3ZZmirBtNKJ6mzZi54V7vdfWVdulZ+dOqs9ncxqXeLkd0lmanD3hoe
 076A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwNxTcL19A4HxGNuZ7Y/E1Fq/RtHHfybbmJ3SqPiqeUq1b9/Y7YHMJg9GJENT06J8bHiBYF/RFBSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxySMnm26PTP4QXo5M7qhnRxIK/iUoIOfFSnyGsjmHKnsbG2yV+
 yY9cr0H2bBPfFBmqJxo1xLbvNmOyMVG6XTHXJNME5B+LLa6CsccOnSUP9bMVD3ZS51PKLqR3We0
 E
X-Gm-Gg: ASbGncs4hbrgjWX9NAVxqaEGe5ybQlqoYL7S8/rKvO6ikgBeAdTdthDUn6choDDnfI3
 UTf/MI/CWz8PJd3r6W9qyZld85D19ZugpSWU7dIHe52rFyfay9aPHdiewBQkhJ64pUILryHKuEU
 a+twnmfgSpyVV5jWu+P534RDYPI0I/Uj7Ity4t6RM02dc+i+LLrhSNJT9xl+7JNwty7UZpE094f
 F1luWUe8dEHzE45eb1jztP7+E+G7JbYbA2uFRrlpCCMcYIfl4xkCi7iTfQIhOnw0t8HnnYSKqJp
 YnMUdY3fKp09Oxr2hKkNv93erTqNsco30hU2SA==
X-Google-Smtp-Source: AGHT+IETfUdZEy4CFxn1YEIQmSr6ySR3G/g5zLsPVQSq6DzfPUY0rl3GN75l8UgZGLkV0LGhqQnxFA==
X-Received: by 2002:a17:907:7f0f:b0:ac3:446d:142 with SMTP id
 a640c23a62f3a-acec84b8840mr173980866b.2.1745913057842; 
 Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7035464e6sm6980176a12.64.2025.04.29.00.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 00:50:57 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:50:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBCE3wSG2g5pp7jg@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBB-gl150GVaZPn5@hovoldconsulting.com>
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

On 25-04-29 09:23:46, Johan Hovold wrote:
> On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > > >
> > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > adapters or docks with retimers in transparent mode?
> 
> > > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > > if it did work before, as I do not have a Qualcomm based device
> > > > without LTTPR on the baseboard.
> > > 
> > > Abel (or anyone else), do you have one of these docks that you could
> > > test with the X13s to confirm whether this series fixes a regression or
> > > not?
> > 
> > Before the support for LTTPRs has been merged, if you would have one of
> > those docks (I do not own one) with LTTPRs, link training would've just
> > failed if the LTTPRs were not by default in transparent mode, which IIRC
> > is what the standard dictates.
> 
> Ok, but my concern is if they may have worked in a default transparent
> mode.

But if they are by default in transparent mode, doing the setup to
transparent mode will not break it in any way. At least that is my
understanding of the standard. Also, I tested multiple writes to
transparent mode on CRD back when I wrote the LTTPR msm/dp patches and
doing multiple writes doesn't affect the link training that happens
after in any way.

I do not own such dock though to confirm 100%.

> 
> > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > would return 0 and none of the of the transparent/non-transparent setup
> > would happen.
> 
> But this is the crux; does any off-board LTTPRs in transparent mode add
> to the count or not? If they don't, how would you ever learn that there
> are any LTTPRs? If they do, it seems we may have a problem here.

Count gets increased either way. It doesn't matter if they are in
transparent mode or not.

If they are in transparent mode by default, link training will succeed.
No matter how many times the transparent mode is requested.

> 
> Johan
