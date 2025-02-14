Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE198A35C90
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 12:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9841010EC55;
	Fri, 14 Feb 2025 11:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xhhidBWM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CC710EC55
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 11:31:28 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5450f38393aso1918673e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 03:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739532687; x=1740137487; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
 b=xhhidBWMZGJvIjNE/ZtVzop4K3XksdwLCJsPRJdd45UetuqInsI6ceYHZWBnEyd2yD
 5ITpjcBrBKNnZaRoqwrvRa1nephl3zA3l7bQ5uYBM4dwDX4MFL6lvIRfr/Nn7vSFtu3H
 ApC9ElyK2JDgC11bljQP10tVl/eU3R8W9FtCc34QDTq3AWEwStYAm99i2O3YTb3XECtN
 u4axI58vja3nCOJIB9h2k0jM/83+I6grpnPdyMrqaE/XrIgQp5jn+8UuHv5IYxbhZLqB
 43MMxxcshAfP7dXt6te2SH+rfUgtSNCmS6AZ/WjQqQnKe6YF+NmDJyn5VLFRUwBUlyAL
 vyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532687; x=1740137487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
 b=hxAIREFckWXv2VCrYmoFs9IJXx5R9kT4U5QYXYJpYoLs59QeuTB9y1DqMu2ZaZ8ohk
 TWtwds32RAyStSyme4cPz0qrCdP0SCDGsdEL+oFiQcO+CjiO/z4QTyoA5okHueAKBcLz
 Gh6Ra/OS2pnPXE1MswUmvia7iJDhwHNrkcj3LKAo5sHE7zfeM+7Rl9rg3na3KXV1DYAB
 yForiu5r8ZPAF0TXzsiwf8ugIHrqIV6WU/oVuWKIa+I25c84uj58EiFOPKGcO99OCorp
 neLgEEdO9PLRw3tZxQAWZ+g9K/TLU+Z77c9Smn9DtGSSAVpqdj/9zblTi8JfWgEygm9B
 YIJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfNJftuQ0TapgQMNZnaj48fORjEQCLz4vw6tHFwSWA32J4eYBWpvJxK6nhx9vrOXVkubmK7K1zGzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvI+W85OiOtADa2i3c+YXFCcRMjxjgbbQDMQ36p0cj9FSKv1Rp
 dPNQTCLWYbh6PZJS86tOZ6d+fFKEZGTdsl7lvWm+QM97Le2yehD+hqjbbpXMHAQ=
X-Gm-Gg: ASbGncuT9Q6kM+l/bVFDPBTVUw7O4fXkHccFWCDayA7PkfrxmnjgBqhRPSqD5ja+f9Q
 H2TE4Di/lyfbfbQJAAo6rIrtcVr1a5uYmDP6huku+zwz0iSOAr3bVv78RdIl5qiv1WnoaTl+0/c
 5UM0IeQjJlqMhZBNaQBRX5IdRYG/pvltFNOh8t3gO3YYV81WnDt966dvj8SqpR92BxzmAySdCO3
 Hg9CEyZ0kvH89pRITaJrulzj84dyVoJouIAR81VWRFYE8OUcDpGgFgt63JZPvPRw3sLWBtmjf51
 HPY55oec/Tem/QCPIg3efSbdYQYiPC9ugf/GkLVMAKpNtaG4Dk6zng36kD+79yPfFbVtWnk=
X-Google-Smtp-Source: AGHT+IGjs9yMg+iCQr3IF2oWlxeySoJlOZkKJgyEb8x4vfVkiQxa9wP3j61Oy3tVPMRng/3g23DMxw==
X-Received: by 2002:a05:6512:2216:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-545184a2e51mr2906212e87.40.1739532686682; 
 Fri, 14 Feb 2025 03:31:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083593sm487198e87.18.2025.02.14.03.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:31:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:31:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <cpem2v3z5slkihza4h4kaocxitpmdpnkrnl3iksevbewsqo5tb@zugjn5ng6oci>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
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

On Fri, Feb 14, 2025 at 11:50:14AM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:21, Krzysztof Kozlowski wrote:
> > DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> > two clocks.  The respective clock ID is used by drivers and DTS, so it
> > should be documented as explicit ABI.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Patch for Display tree, although with Ack from clock.
> 
> 
> Any more comments from DRM side? Can it be merged?

Yes, it can.

-- 
With best wishes
Dmitry
