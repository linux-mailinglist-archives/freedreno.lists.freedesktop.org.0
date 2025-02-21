Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE200A3FA50
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 17:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803D910EAA4;
	Fri, 21 Feb 2025 16:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p3tSrZ2X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFC10EAA4
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 16:11:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-307325f2436so21769131fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 08:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154291; x=1740759091; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hr3XzvE9aqClELabiY59euwbUIuS5g53m16CEDx+PQs=;
 b=p3tSrZ2XdQTGA0YnzF9kBXsGqZ3lFP0omYyA+KHTVcb+yZnWN/qE2cv5oMfs4SKYTk
 lrnJY16IArrGTfDMc6KKbmPFw2+86UHO/oEgtVv2+BWbBbg3reul9ZC0ByrEb4EI0dZ1
 OdzVsPIa55RbN3rh+mN31Zg4X5imesHklNo43y9zL4vgmVMo7ntPDgS1LXVMmApJ46uL
 ItIkILlBJkB89sUPq9f7AlChAOtsSzdVemIQ/mepbVFGwF98Wb0waOBAj+bSm1Ztqq3y
 yvGZIkZNUC6C+ERaV1VgzerBSrZFlGUm9cQ9Bv87JEQtWXeLvovgKHCibAUOuf+dF1wJ
 ZXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154291; x=1740759091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hr3XzvE9aqClELabiY59euwbUIuS5g53m16CEDx+PQs=;
 b=v8OX/C1Bc9zQaLleYOBonv2B8E7n7EN9JKVCWTLzWi0q77Xt2t8Vn6hF2wM9VRBQBS
 cA+hpyGa6a/8OTkmsq2KzpmJNm03EyJKvokcxzhE9Ifdm51civkgROV5z6qDatKsh2vo
 JfQmKfuctFW5998mPimweRjCVHnp/N7YD01uvlL16fJconMg6+a/Ul8Bm9tOv9wE5lDL
 ZbIs9kZF2p8xkA9p8FsPRRBYis5LlYzO3dbVH3ZrdkHqXdBfsWtCPYboZYIeUoEVnZxP
 +pylw8/B1c5ZnZErrQFVRsw5V0ofDwSlsecChEl1dHd5uaXunrBqZbKWe7KMS5+iv3bC
 gk+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Wn+BKqZWMXDx7Nu4Ki2eYYjXHoEf34QU2tFVddbNyYYVNxlK2CC9mKTmRg5OOpDNamMUo0VpHs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Qv7SPHVDM+JdasfttftgDiC/o5UMYwSzuvWI1Bds3jNJm6Ma
 7G67BNIbtpgpQ1725ZWKHqyotX+4Jx4vG7o1WJUMc/kJHBfbkKUeXJtoUNSAfLY=
X-Gm-Gg: ASbGncsX9Mz5m2oFZyLRuwhOpaG9eHxGTlYIF1hAliVsbCLBjAmxze0jDUtcYXghqeG
 BbkM/62nB+5cQTbg1VcGynGRMQe3Fn+V3zpPlU1yTDmWeh42MImgv9DuWJ0Tafs3kMuI5PS7DaN
 ftUpHnfnuagTBtMZmNJMLFdeLamJ5nHp/kVihYkBK5NEeIqMmHhVFeHDUrcNl0T3jmjUDryJdYC
 Y03c/XzJxkXwQ8mAJ3W+LvVvn4mna9BXkA99/PX9tPf0v0qm1najrEwIEc7zS3dSvumcKfPA0xU
 RMUnA6aoh0CYFeozBAxti5DMO5ByXlhFRcbXe+OEeUE8fUp8qifBWYmZo5+4LPwrybp1ttkH4Vj
 xP3vKDQ==
X-Google-Smtp-Source: AGHT+IGfxPa9wWy0xBwDTcpNaXXhV+ontjmSCYJHc06VMOigSb61bjng4QxI7OTQ69hRP9FYbbAr5A==
X-Received: by 2002:a05:6512:33cc:b0:547:6733:b5a3 with SMTP id
 2adb3069b0e04-54838ef5b91mr1459696e87.28.1740154291461; 
 Fri, 21 Feb 2025 08:11:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531815e02sm1986700e87.228.2025.02.21.08.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:11:31 -0800 (PST)
Date: Fri, 21 Feb 2025 18:11:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v3 09/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 mixer reset
Message-ID: <tggda55h5mbhqekdmkkk2xpww2mblmtnqz6l64uv23eoh3rfcj@reirdm445sw3>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-9-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:19PM +0100, Krzysztof Kozlowski wrote:
> Resetting mixers should also include resetting active fetch pipes.
> 
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
