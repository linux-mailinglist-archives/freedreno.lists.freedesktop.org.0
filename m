Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A6A134A2
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 09:05:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1AF10E8ED;
	Thu, 16 Jan 2025 08:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p7ck0bC1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163D210E8E7
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 08:05:21 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-540254357c8so685866e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 00:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014659; x=1737619459; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
 b=p7ck0bC1OHCs9nOgJ1t/DvqZOonLzrGFdCDPV27sthZ2+FCnB6KD1129Dt1OKDLlUe
 OkgwU39Pjig0M3tvjzYRQr9lbjaSmg76l5tLaNX/lA3LmbU+dAbV0XVf7AI6ygeqevrT
 YnTXPZ3MAwi+6Bt5SylNI7QgIXsCo5CQAT/Esl11CTNd4AAXkUTy94psSY4PL4XqyGpk
 GdYjuxRkzOtsb3BR2XI9fhgShpEEQhHuto+P9hgMfmQH88RS/KR16SW784XwUO3t1ROe
 YLONFO/4Zh6RfdmTbbkBlTLHH09uSMHxyLp57By4+PYwUklWS5danajSZZ4EdQjQXxgV
 PmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014659; x=1737619459;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWhOrb9/UASERUslvHT6A+SSMFyYSjLv0++Pj5Kul+8=;
 b=qrIoH3qkAxx9lFspVPuGf7m4mIE+8EepzHLSEH0tsW8hVKV6GjEMUj0uPK8NjT3er6
 8lZS5whl0mtCGvuVnGqbCvRoAMWMvt8oNxD2Bn4aLHgz5W4X+q/qevbus9jNDYyBYfsQ
 Rpd2OkMD5W2rSeG/RPXj7/W37hwtF7ehXXTFwaJQKsbxdx8yKCy5GpmEvNDjpanoMMDY
 aZQkfPOM1+U+ptL7cN5g4kac9jPK4JWF7VpMhuRvLMzZECVnDSXVJpPSstSNVmXlg0YK
 n57+Hn5TU6VPhCpJzPQKn79325AH4HQRr6fCLnGZqBxWvegaItiMgkaDWJhPyI6iQhMf
 ADSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP48LrROrLe2dRbClvaJB0PrLnUCv1AZIs/5AvobNmitrXm9MwEhJqiatxtKyAoqvU2lx6bc4tzIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGYx1PQdu5GE+yJAoKST/WOdpd/KLTijI+u3OEXjd3FlnzgQc6
 iRKCELw/fNHCogfGr19uHxVfgMo73OcuZZiM0Wf5g7JL2bfQJusv/G56LkZoMCI=
X-Gm-Gg: ASbGncsMcyuD5CSMOG+aa2y1txQTc43mXSbe3KOQv14OdrNJRVhcXAUSNBQEK5cFr6F
 gL3peHb5Skb4wV9XxMb3OasY1CzJILrf1yNqtTEup7sDhOX+zkzKN/KtxFQoOzirX/Lajdf2dou
 geuvblWU/XQ0t3C6za8BQvxoK8fd5+ZPuIf8LdYPz7JVfR6ZB7TRqbEdCSJHqE4/jS7ddl90fk1
 6crv48VZrR/qeE4DW4QVDAqTdYgNaSANfM9+qoQBr3JqUbPpGFvg1K4tzuyvBEkVXY1S4U3ovYo
 r/UIWUcQu4LCg8PzJayFP7oUZNwCYKcxQDER
X-Google-Smtp-Source: AGHT+IEuDBWymX+JxWIF/uLo9WT0Lp/ZRuWOf2NfkbN1f2elgSAAg2ctJNMqdzX6Qa3aZuc+njgQRA==
X-Received: by 2002:ac2:4e0c:0:b0:540:2a76:584b with SMTP id
 2adb3069b0e04-542845b969bmr9906447e87.36.1737014659463; 
 Thu, 16 Jan 2025 00:04:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be499fcsm2251566e87.8.2025.01.16.00.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:04:18 -0800 (PST)
Date: Thu, 16 Jan 2025 10:04:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/16] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <vyc6zvymcaaw7nlkrsmxwrpbh5u7znl3pyegex6xndz3ibmm3w@xdm7lxlibkvp>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-11-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:26:00PM +0800, Jun Nie wrote:
> Split the PIPES_PER_STAGE definition per plane and mixer pair.

Why are you trying to repeat commit subject? I noticed this pattern in
other patches too.

> Currently, 2 pipes are supported for a plane at most. A stage struct
> contains configuration for a mixer pair, so pipes per stage are
> identical to pipes per plane in this case. More pipes will be required
> for the quad-pipe case in the future, and pipes per stage will be
> different from pipes per plane in this case. So pipes per plane is
> split out as PIPES_PER_PLANE.

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

With that being used as a commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please use this as an example of what is expected from the commit
messages.

-- 
With best wishes
Dmitry
