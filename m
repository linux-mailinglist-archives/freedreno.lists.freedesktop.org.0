Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEC27AC773
	for <lists+freedreno@lfdr.de>; Sun, 24 Sep 2023 12:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C4A10E116;
	Sun, 24 Sep 2023 10:09:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AC810E110
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 10:09:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3231df054c4so843591f8f.0
 for <freedreno@lists.freedesktop.org>; Sun, 24 Sep 2023 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695550195; x=1696154995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d2UMVpz+yvvkwATkXQokHfFZzHF3TmawiwpTGEMOBpQ=;
 b=vWxV6wZGC1HX98m4ILNjvtKGjBebatYokeN8p/nvUGLrzyHz8+2498SdXywyvIOjuc
 uXDmlH+2aF9cFAS/acqOX6km2iVMSrnz+LnHhJd1zo44F7+Ast2clIjcT/BY+l+rKSHO
 Rg9Jb9s5W1cYMO3ss1BpBxVeZeuc2pEMT0hBMPOpFihXrbeXaFZ7fDfntYh25zaMcYK+
 HMBWRWp6whUco2in5pIqyqajdw1Vu/bgMJ410wKewH+Z1vZo+miFRZjuuwSDGyOvLnnG
 botbQY47V4j7INPW+8zR6KO14ltFPkxlKPJfdKhks0VqLopdHhQeE06/xpZGDjf/ji+u
 4/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695550195; x=1696154995;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d2UMVpz+yvvkwATkXQokHfFZzHF3TmawiwpTGEMOBpQ=;
 b=lFHrAGePOlCtzbKE9JT6yunlOAdNS9vumXSrE+MAUOB11czLJGsR1yAgj3sRamlCZY
 9uefxZnyVGBxbBLERwrZDHeyCly4ZhFuXitf84RAuEcnT7V0IPfojX1sGUWgNVw196lu
 vvbv2ptdbRpCyaAhNyi7TQy0XLXHM4Rx1N+jY5btY9HRkQWugaB50YDSh7Yz2M3zQtde
 jRg/CLUFxqCKubWlMAKB1PqRDOQ4FILflDgi7zXqObIhggSggSu7oMQesKT7X+EsSNNW
 YQkolcUBNXQ6Beq+bkbGFnoigGweIfJDGqTQtRlXDE+CaGDJDn3NuRnVP968eLYbAJ9I
 VMAg==
X-Gm-Message-State: AOJu0Ywm+qOdmhqCorJ+adTdOWf4snybAk6mryD9t7EBKCTDQK/xa8w+
 MlFLkpFQwfH8iW10o8GYHiXLpg==
X-Google-Smtp-Source: AGHT+IHDjtkitMT/+apVHnmsEYPtq5T343OoIdxluv9GvpNWnmlfEU8l0VAIXXFUrKjCoPD+hWx8cw==
X-Received: by 2002:adf:cd81:0:b0:321:61c1:7879 with SMTP id
 q1-20020adfcd81000000b0032161c17879mr3556577wrj.30.1695550195694; 
 Sun, 24 Sep 2023 03:09:55 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 c12-20020adfed8c000000b0032179c4a46dsm8886160wro.100.2023.09.24.03.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:09:55 -0700 (PDT)
Message-ID: <7e230ebf-7c12-4809-b6a0-285eab805a1a@linaro.org>
Date: Sun, 24 Sep 2023 13:09:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-5-a820efcce852@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v6 05/10] drm/atomic: Add solid fill
 data to plane state dump
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
Cc: sebastian.wick@redhat.com, contact@emersion.fr, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Add solid_fill property data to the atomic plane state dump.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic.c | 4 ++++
>   drivers/gpu/drm/drm_plane.c  | 8 ++++++++
>   include/drm/drm_plane.h      | 3 +++
>   3 files changed, 15 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

