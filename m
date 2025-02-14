Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92616A35C8C
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 12:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445C610EC4C;
	Fri, 14 Feb 2025 11:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B0ESxRyO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227D310E263
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 11:30:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30738a717ffso18920041fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 03:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739532627; x=1740137427; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
 b=B0ESxRyOah/HW67w4tg5b3RB94jpe6mCM87Is8YcWd3Hr3jlXuWmufKXp0dipSLsLl
 MBhjpSBbP5degKUhS+ISZgwpK+NKaxsonBXRog8v6qecgBxdG9FuAR7RIMIz1djaUeGu
 piZeVtCNfYMXnrtly47yTcqCK5Fv27nB/BJjxodGx4L99mqcUO3WZ3ehRhFwuq0vfUNx
 p5SqQ8tn93uAYNZ9osJGRD7JnBi3hnfEhnCsaIs06V3gClMstVP3J73KsXFOT31Nen49
 JLRcTEX7Bq6S7QJe/mTACSH4NiPL09Fes56TYdQrDq1CuEXaK+2yteZDOZEeXHEQev/E
 rJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532627; x=1740137427;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUXfDOQe1PjE/GwHmj5OmmzZEaxV8TIkFPa/Dhe7pKw=;
 b=LGN+x+pme52258GGW/xUej56kV3M5ttitsbTaHHfwPrcGJvBRR13WL91tL+t871f6G
 PogN7eYiqBvWIgOrbfHbaakNal6mjOLOhZrBln/g3K93YYlOSK1b6lPjXvIcWgxbxEQj
 iKx5jT3BsETSVqrSKgZGyOwVuP3oKgI5t7yCJHJo+lrxNRInbeGTEkxDWJsGjBJ2UmbV
 O4AqiAWqNwpPlde18XUMXEgGUICMaQ83ZQyDtgMBZh+sa9U4QHx+KzetEf0/qHMF/LvC
 Ufub+XKlsAVoFYIELA7Kpj+zhKUEOKN+r8ZHQWb6JkGxRPGGav+G1pdD2qnDCRY6+kTo
 7n0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlMEEUn6V/qvMSTjbIteY03mJvEPMowvRqyCfFDG9HtNeBQTUsaFuB5MoiORJFDsinsPHI3IKOKTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB/7t6+ZGEm0nqdk4yVv6nEYiYJhMZK/q/GhWEe/MI8qzz5oGS
 WC/LhRTlCIkdsvZp76k+UdxCoqW9H24TPcAMDQRC0F/aLVFOiQWTd72ei0Ij5Qw=
X-Gm-Gg: ASbGncuHBaK5Oy8H9VXLj8/ER1uEd08GXqhof8wOGL4GqZ+tIlLVcSyCwFBmD6bUD/K
 4J/0A5lRDp7fRf1yWHoX1FspjzUvbn+0YQBckp3VlrDDlD4Fj3lx2nOwZ5/ZSxRlPZlO2f/+pJs
 FslfaQSQg08M8O94nye/lJB2C0OU5bmChjygrpfqWomgzYL3G4CLCgaXzoPNJ+xp7mjrUF4GZAJ
 bykre4aPKMCAlmokyOYl0LT6ARDsL5DObPy/DAoXlXgqzD6jRLOYkomObU+QoUJTGdNhC541Ztk
 6BiaDGzl5YvaoTo8U6slwu8Sx+wQwzLbvIcoUp/HMNHfKCbvf1PcJdBpVgXNugHgvk3+t5s=
X-Google-Smtp-Source: AGHT+IG1HjnIzHq0g6LCLS2rLFVsIGs1tP/QSpXsX3Vtdfzqpm5vZz4Yto5JghYhTAcD6DaFR7+wyA==
X-Received: by 2002:a2e:a58a:0:b0:307:e498:1269 with SMTP id
 38308e7fff4ca-309050e318bmr35230061fa.37.1739532627133; 
 Fri, 14 Feb 2025 03:30:27 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b769sm5097411fa.101.2025.02.14.03.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:30:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:30:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dsi: Minor cleanups
Message-ID: <r5mq66osrzle4xbduvaqhv4ypqc5dfkjrhvqwchjmni2q32sbd@gh77gkgj3imp>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
 <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2bc7a7-2e28-4599-bb94-fd66fd2ba88e@linaro.org>
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

On Fri, Feb 14, 2025 at 11:52:14AM +0100, Krzysztof Kozlowski wrote:
> On 06/01/2025 09:49, Krzysztof Kozlowski wrote:
> > Few minor improvements/cleanups why browsing the code.
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> 5 weeks on the list. Any more comments from DRM side? Can it be merged?

Are you going to repost for the patch #2 commit message update?

-- 
With best wishes
Dmitry
