Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E8A2D37C
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 04:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DE810E1AF;
	Sat,  8 Feb 2025 03:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kNPCPoRw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A0E10E1AF
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 03:24:36 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso25192471fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 19:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738985075; x=1739589875; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
 b=kNPCPoRw+YWWdGgf9tdy3uvxKrj2FoHOybPJbE5v8Hzxi+e4KE6rjs/u8aI76zeAk+
 0qsOat5AP4wNnMQ0jjzEpJJHPEvPSgHHzJ3UZJ1A2vTmp44kSJauo/qaYl93XKprqWPQ
 jZFZ2jk6E+YwSiJ1mdwFZlS+kb6D46ExlOO5xVWfPibyV/QuspNIBpaaB55cH+WJMHvE
 5pNr35usvvcX396eSBf5RT83J65/uhPLHHhElC8am8jHrsD9Ci2EBc0mGzLC4EiNb/an
 PLZHsFiCknUQvNZ9i0dCk7WeJLxy5lqD7yZkIZmix8Xlr/qDO5foXWdJSteMCggMTUrT
 36qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738985075; x=1739589875;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
 b=u/dAlVs7NnTw/v9CQzlM1QEdYVDreQmQxtDGK5MEC0gK8eCMmMTn29k1PMq2xsfcZH
 9d5852euBV3uE8ffPa0Vw+bojTkZXwrHqFmv7h8TeC4ql/5lW+9icF0xQrSS99anfeck
 BF6AXdbHHmXmaDvvjvCYa/g+hFmgt5svpxnPDrD84QyS+FczqzuYatsXoAcjFIknernN
 LvOJGk74SM9I4J9lDNeB1LevjUrgYeo9teT44wKS/e0DQs0gdaGp1DjjsEoGx8MWux/A
 Q2MU78vrMAdj2WQ6pVoeG1GB2qW4HXZuvzQLcwhgCSgNcgls17nmn2Z/DMczQlFVC8tl
 7hOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAtNl/fB76KESvOjIVj0gLjlPcgESv4jICuxhNb7ni410AQEOMG7L/SBGi6OUK+ETds9yfp6aPHJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ3Rdd8uBARMoWh0wiA22ktL/Ulmuy8jlxRUThR9Egp2/wetI3
 zdJHpeyIA89Q5h1BEtsPZwVELHdXprdrLpzMVyUFiGK4pAcvJ/9R9KrVUP2zoyU=
X-Gm-Gg: ASbGncsANROwRrzQf0G++5uDoV6RLiLnNY46rWDXaRZFRN6FSWNY2qQuTzAuZf2+O92
 tJEMTfQ16n4yl6u6VGF+HsqC9VurbCBGR1GPvJAmh3ksBfqnMvcKytWH/e8AmPJlfwuYzfQQXxR
 FGFOsnKqlDQWfNP5YUakgPm/hnvVHAxkDqBDejQX4VGv5zunwBA0Qy7Af0U28HPevMaBysZ9//Q
 1+ovOMhgXB6FWFswAUDXUuZ6maK4laUnVUCL/AxuOfCi2FLN3ZUlCkJHKseDt5lFwMFo8gEOrrh
 eQLf3j2H9ihfds331COaUKJfsf8KKJHLsOv6VXThVSy9nJIUntjTuCh7Rx2SQrZsqWn5Ms4=
X-Google-Smtp-Source: AGHT+IFydtUFynrK2gRpKzEKvd+/uEV8NSFd5so2WMhom1ky7+A67a+p0tJRz+0pk2ZePPqPbJ3Tsw==
X-Received: by 2002:a2e:a550:0:b0:306:1524:4a65 with SMTP id
 38308e7fff4ca-307e57fed91mr19942481fa.20.1738985074455; 
 Fri, 07 Feb 2025 19:24:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1a67c9sm6260441fa.48.2025.02.07.19.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 19:24:33 -0800 (PST)
Date: Sat, 8 Feb 2025 05:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <ry2jfdxhbogl42wbiajll5et5n2puvu46fn25v25qwpac7bbyu@wvhz3ijtfd56>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
 <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
 <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
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

On Fri, Feb 07, 2025 at 07:05:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > > > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > > > 
> > > > While the HDMI block has special block to send HVS InfoFrame, use
> > > > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > > > that requires manual repacking in the driver, while GENERIC0 doesn't
> > > > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > > > HDR InfoFrame which we do not at this point anyway.
> > > > 
> > > 
> > > True that GENERIC_0/1 packets can be used for any infoframe. But because we
> > > have so many of them, thats why when there are dedicated registers for some
> > > of them, we use them to save the GENERIC0 ones for others.
> > 
> > True
> > 
> > > Lets take a case where we want to send HVSIF, SPD and HDR together for the
> > > same frame, then we run out as there are no HDR specific infoframe registers
> > > we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> > > HVSIF when we add HDR support?
> > 
> > Most likely, yes. That would be a part of the HDR support. At the same
> > time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
> > HDMI 2.x (once Linux gets support for that). At the same time we can not
> > use VENSPEC_INFO to send those.
> > 
> > I can imagine that the driver will have to switch GENERIC1 between HDR
> > (if required) and SPD (in all other cases).
> > 
> 
> We dont have to use GENERIC0 for HFVS infoframes. We have dedicated
> HFVS_INFO registers for those.

Ack, I have been checking the old (apq8064) chipset.

> 
> > > 
> > > Also from a validation standpoint, I guess to really validate this change
> > > you need an analyzer which decodes the HVSIF. So was this mostly sanity
> > > tested at this pointed to make sure that the sink just comes up?
> > 
> > Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
> > been validated (validated SPD, AUD, HVS and AVI frames).
> > 
> 
> Yup, vertex2 validation is perfect for this!
> 
> Overall, I am fine with this,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
