Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC567D4F1
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C110E98E;
	Thu, 26 Jan 2023 19:01:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7735E10E982
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:18 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id k4so2203678eje.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
 b=HCJKjiq3GNFduyzH2nOCkRTh4dBUXS1OY264zhC/gkzdTkQWV7uFD3vkchrcHYlATa
 Qt37nLapwe+NljxPwQHFQSXMwzgF5mtYvWtyoICGRQ92zBUqKfR6Sz9wz1tR1JO1qJUj
 s8FZt/KQEWbY9W9kpysUN4uYWx/7mI0LtGI3bIMc8kx7coqnndMtXRXwqKlJjaaROEWL
 /GPqrJap2htFMmHotLdvkyvSliGNVweUwJo/UHYHb+CJfdaTDA/JQ1lAb1ovgC+AMrxY
 b/dCmIdiz8pehIdNgDfwHRACxRNSOKna9JlqUV7gdE18CTAhfAgP7r/tV6Y6D8y66+mx
 yhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBWm6FSmlOHy18aqhTxXmGS8/TFLM/DG4o289iZ6hFw=;
 b=LNQCFwz3dlZWEt2ZIdJO2re7xkXGTnMNRYxubYqOfhKIUL394vANVqbt3DKPC5qjHf
 TbJTesSueG6bxj6hKtb1dakuvkqAj296A5cLQf9hO5cQ9+eX4LXeApUWpqTPo+ZyFyAj
 0i/uLXajAMZhb3qar70vi271Oi2xXSw5R1WAE2vmDtB98umvTWIwm42oelSriCB2VG+a
 BHOjgshAnfhfE4mDPo4TBxItQrAhiX9pvoNLp5IL5KseWY/xIb0UNSwod+c2G6FSZBw/
 4AY54v8ZKJbEXM7ynKm2DXI5kSo8DltAt4NhnbRDCwMfPuKU0yPpBtYM41Q3tGtIvTV7
 EPuA==
X-Gm-Message-State: AO0yUKWoUHvjM4TF/rfdFCOjMnNJZ9di/HPZMsUBkyrFxlAwbudiNsDm
 jVwhcdzHd+xVZTSPd9ivNlyxeg==
X-Google-Smtp-Source: AK7set/rsuFfe/cwMZ3ZuTOvMPjnMOP/rgYnI0ksZLx+5S5MuskuUnGWpyCs2aNXPzkZpjFYgDfRJQ==
X-Received: by 2002:a17:907:8809:b0:878:5859:b019 with SMTP id
 ro9-20020a170907880900b008785859b019mr4044768ejc.48.1674759678131; 
 Thu, 26 Jan 2023 11:01:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:01:01 +0200
Message-Id: <167475959091.3954305.4158185883745972292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
References: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle
 setting to catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 23 Jan 2023 08:24:15 +0200, Dmitry Baryshkov wrote:
> Use the values from the vendor DTs to set ubwc_swizzle in the catalog.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/31c318051040

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
