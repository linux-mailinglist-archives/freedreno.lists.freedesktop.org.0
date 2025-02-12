Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A103A31A46
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 01:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BBC10E777;
	Wed, 12 Feb 2025 00:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P5Kg5vL3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179410E777
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 00:16:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-54508b026d1so2872664e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739319371; x=1739924171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
 b=P5Kg5vL3UL3eYK09KOUI5X3ORxmgY7WkQzHngdl4C1zTrTItI+4VyJPVcBoImROrrY
 4TUkcL93TSyxcFRwtD8ZRpU6EJ32jHC+Pj8dcJi7n2f+aYLECwid5yj74zq27idFyDuX
 cTVpiqgEgHlZkYHIugxQxgqJ3DbVS9omzdViYfAJIcSkloR2e/PQA6f5K2sRK1WfNgqY
 rUG1dE2V1P/Teb2/ajZc9VqzYkpQvEHKg1FUZbC5IVQV0Kpem7cKBORDaNx7pRVCUFvx
 v0KC6w1NynZ+pG3Jjg+d6QzUGcYZkruRN/2vA9KxwsIJJIOeh05dF5EJ7vnBWT4rT2Ad
 qkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739319371; x=1739924171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
 b=WAkF/s7L4U0W+u4lk7rWbvL9zYzZs/NgulGADDG93JoRHKWkXAdDkyFiCJJ0VfneVr
 YAhndZh4nRqHLu20BjLhr7xVNWZ1DlpBRXm2Df9UpXlSGRC5H56/97LGgcg6Ehcv10T3
 9pyog8GZLNEdS/XIJ7MKQ7E1G+vlvEcrHcaYX3TASJLFgKbPWaIpJVVsLYHBGhtPV8Ry
 GSEOJDhtjwhRBQQi+AOuPuZIxkM6/k/bt0s5l3f3sWxSZAb07kREwoEU1A/YF257iPd6
 rnbyWV6nV7kbXEAKihAEqhnNRdIDcpGsve4YYxHvv4vXKR0lvESN1knhHeHBLNn1Wy8m
 3Pgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtpW0UklpyMZtH7w933YrGkS/bZs+EwT2NSJKUSyKV9ctepj0UcYXvwibbwE5lkK0pWUktR/ALf9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTD5YiC4wN+bDD01mtX+0sLWh39C7hK+DKx6fsBlXm3ZG9k3jw
 odFxLJGHxomECFxKG88sONl4OZeTnhjlz0SLexlMSXrS1b9Kk7jTpK/m9/f69mA=
X-Gm-Gg: ASbGncsOccpN2FSLIKNmMKdR1v+v58/nKvNs5AEhFdi+ErGw205O4/466Vzp5vb24dz
 6r+fdhFAHK6uHvWqzJ3ZOeULwHU/9Hu9pThrBuqzK4ZiJ/Cv87pE9+HcpsiZXsnZLafMdNTkckH
 alR0EGxfk+9rgt8Z6d+LGFDB9tjpEcCAyihYgjaAnc1Adz8lHDmOAosW6IHr7UlGDK51jC/zWza
 5ftEa78DQcjdKPMcknT5ovZjsw9mi09r9pO3cjekIROmbo7l1totw/6t6ktGHB6RHQ7n9Qj8mh3
 zQ2zUGn9Rs6ieCcDGD1z9l93ZDos/52pJu6+u0iz9ArZhvF5i0dNsG0nZxHILVGJ7gdI9f4=
X-Google-Smtp-Source: AGHT+IHy0V/tdcXjGNazvy2Zt+CkmxrEZA7UjXkUXMZVFafXjdfWax/sQBr8F95GBvsvHUv1FZm7oQ==
X-Received: by 2002:a05:6512:3e1e:b0:545:c89:2bc3 with SMTP id
 2adb3069b0e04-54518178d4cmr243784e87.33.1739319370883; 
 Tue, 11 Feb 2025 16:16:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm1053658e87.1.2025.02.11.16.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:16:09 -0800 (PST)
Date: Wed, 12 Feb 2025 02:16:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Message-ID: <ma7ur32qudbxaqt7fejgxiqf4vqvsd2o2oki6cz5enwchdli4n@xk5dptvjbkw2>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
 <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
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

On Tue, Feb 11, 2025 at 09:26:31AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Feb 09, 2025 at 07:04:46AM +0200, Dmitry Baryshkov wrote:
> > Supporting simultaneous check of native HPD and the external GPIO proved
> > to be less stable than just native HPD. Drop the hpd-gpios from the
> > bindings. This is not a breaking change, since the HDMI block has been
> > using both GPIO _and_ internal HPD anyway. In case the native HPD
> > doesn't work users are urged to switch to specifying the hpd-gpios
> > property to the hdmi-connector device.
> 
> In that case users would need to update their DTS/DTB, so that's an ABI
> break.
> 
> Please deprecate the property here (deprecated: true) and keep support
> in the driver.

I will expand the explanation for the need of the ABI break. Yes, it's a
bad idea. No, it doesn't prevent the board from working. Yes, it needs
to be done.

-- 
With best wishes
Dmitry
