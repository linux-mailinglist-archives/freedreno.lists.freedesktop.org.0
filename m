Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442CA3FA54
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 17:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCC910EAC4;
	Fri, 21 Feb 2025 16:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lrAEoiy/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02210EACA
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 16:11:49 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30613802a04so24195761fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740154307; x=1740759107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
 b=lrAEoiy/ohxSvrjkTx5MhvbLUdgp7m+eWVvzMNRMBurwzWOAzXqrOD5N/gKOHmIfMl
 HVHAVT+C0Otnzfj1f5f0uV25qgv0++cIXG45eaQlGdA0zqhAwNxI7EaRD2X9NqNrUs7e
 0nBjtVKp4rozpR9hZ6lat6Cm9NP9aFEe+lUHrOIODZjBXAyWEWz71MIeZVbQEMQhi7wK
 9p4TuMDtvPTx6TNNkeCqh9KAGf2xoPBLAUWrnWNIB7mOowKWlToXU8lMH1f2RymHWmVt
 UjtqtJ1+OAU1exInBsGsoppWjl2nn/BAPPE6lmtJCHKBxNWXqo+tKr7XpyFnQaCkPj/a
 lLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740154307; x=1740759107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+tgAjCj9MawDwVZ/hBSY+WAuy/JgEh3oVqbLFgO/vU=;
 b=Bo+sHGvR0iANXwhxbrsGwNvP1bo+qwE4qZI3WJIdjuOtZ2JJXzd52LJCisSUZeA4jk
 1tKXNuOlf6KcOkNyj8RYqCufFiw5eV8qczGGZCzoiKiqCoOyEnDbx9f28UCqfBM08+A1
 GhZ3P55VXtQ3HiLM+BLVOk32YZgIIEXlCmLtjOEXk6DSKUfbkqwPHHNffl+0IqQhe3Js
 QQ8vuyvwHKABV/O369LgcoFzfxVi9J3o+HI5lXXx0HLdeZJwEnCUbvSZ5F4ebWJhndw1
 Z6dNAPKNhqF2IcRai0wc392OwGZA/B40kq7MmpPKbxfixnPx08NZfYj1a7bl1atkfgcV
 nTCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFdyhZGL29/Gcfz4LeFU0JtpaYGh77kXk17nu/VRw5QT8b8ykYCwR8fFexA7U7RHHxsIVdQUVfpHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjOXDdS+0yriEJbj/oX8/BGNvgtfmWdKSOFDRInIeUrVEV0xwN
 12//DDzapxuyID1tv4osrZpJzQu1HHZawLSjUvMNPMlRrPYmWX0x865WE5IaHXg=
X-Gm-Gg: ASbGncu1E+R6oT1k/PWfpsD1bNMLYjUOWvPZ+7PE8I4+v3og4RuXSOwsS1DW6kZpYGr
 +lkaVxJamVcIzyx2EUr2wezYQyq93Ibo4i90K8YRwrO76MluzQ5elEJ74IGtF1nuRtMvWnRPcCk
 DwuVLb7AS/sEVelKBi4sda5R0SG0mh4KXCVkIG9IXcZKmqhfhqjSdG9DgopjLICz/2MWrtSXlpL
 9EYocE1M+FEnVZoDORUp801CFbWY/sMjb7uvAW23IfrM5FXNL9Hd8dzYkAwEmyfeufeplvWLNfW
 RSi/3CBtto7z20Egdwo44fdwqJt7uDqcxAERgUVAunkEKD7uoCo1mdWw3eJmsei8E923SgDegs4
 rI5sSXQ==
X-Google-Smtp-Source: AGHT+IETyZBtso9u2xTJJhnVpTpjfbtC5aJNz6G9jWZcCAmcTZJGEkXDdGpqS0eQHNV8suEN6FsErA==
X-Received: by 2002:a2e:8854:0:b0:300:330d:a5c4 with SMTP id
 38308e7fff4ca-30a5b1829dbmr12028681fa.10.1740154307464; 
 Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a4506729bsm8828231fa.108.2025.02.21.08.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:11:47 -0800 (PST)
Date: Fri, 21 Feb 2025 18:11:45 +0200
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
Subject: Re: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
Message-ID: <k4ivqzdnvmllek4i4kmbqfhjcz3mohmromcfxyyn2jw6efkju5@mug3ndaptajs>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
 <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
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

On Fri, Feb 21, 2025 at 04:24:20PM +0100, Krzysztof Kozlowski wrote:
> Resetting entire CTL path should also include resetting active fetch
> pipes.
> 
> Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
