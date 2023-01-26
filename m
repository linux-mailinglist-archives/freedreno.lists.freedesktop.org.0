Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F11667D4F7
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605DF10E97C;
	Thu, 26 Jan 2023 19:01:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E100310E98F
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:27 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bk15so7659146ejb.9
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
 b=tfFFTgv/BHAgCuMgHic7psoRBdMEThbyYFEoxehEBTOWzQ/uMNX+GUeBHQwaIB2XNP
 ERjJtqrUXoRLqxNweGBee88WGDYcEK/GjmKW4XpartmaLZv6V2ZGdwk3XRiCtQQ2Mdfr
 GL4V29zMIRCN6IUK7em12uijWKTOePoAFg/yEmSIkTePXMqKXhkYmTvEj8/hSZRMng3q
 ZKLEFd9o9OjNvGSNqlD+LQgSLxNw5awj95Lax1bQby6e7bj5R8K2RQOIJ7J5mJ1NXJdw
 NLM3g5Oc/SMso/WSJSusNmArJSBvmLNAz9AoeOzKzzbeMb8fFafvveA3shVqXGmDvCmP
 Ihtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spxzCvWMZNGjCVdIu38RxpJRhK/Z/NWL8pHycLSebmQ=;
 b=Kv0rzMjkjc9YcWZYPuTbqYXws4SSu++8tqzD3tHR2k1UsXObgZICSn8W4mFDk2Eazj
 4syWBGUeE9fpgoermQOENB+CHzQVlyNo/aoACmka51RGmxkrFWMLsdQK0UB2msYrpS6N
 7bbouk1Se6gZmshlOzvqiBeyDwYm7wjXCRXTp3yx9mKodHXb28pvwjGwD6Pis3JU5K0a
 AlKyVsg9RCO7LyzoQ5EePHsVj4ekcPfVnIrNpzn6S6Iq7Qav0llQuQ76Ed1HdPuLV0sq
 cKCAaqtoYgiyNXJBNowAHNbec50wYnKXVmg3LKa5Fba03NIQBqgO6ElFwU2thtfGkQYY
 L/vg==
X-Gm-Message-State: AO0yUKVG0bdCa1xt65FAtfqe7gmgjVh3nig9RkpglCOEOo8LQB6rvTDA
 qws5ixDa4AHO9WICUGmJFHU6IufjfSQqBaQl
X-Google-Smtp-Source: AMrXdXvONfAchFoBBXRLeOSeCkHRQ0a0OML3R0M4wvDJdl1RbQ5vEO1EuPSXU1C4R1XhzdRbckcV8g==
X-Received: by 2002:a17:907:6e2a:b0:871:e9a0:eba7 with SMTP id
 sd42-20020a1709076e2a00b00871e9a0eba7mr114187337ejc.57.1674759677058; 
 Thu, 26 Jan 2023 11:01:17 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:01:00 +0200
Message-Id: <167475959092.3954305.6114466663936878073.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
References: <20230118020152.1689213-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: use strscpy instead of strncpy
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


On Wed, 18 Jan 2023 04:01:52 +0200, Dmitry Baryshkov wrote:
> Using strncpy can result in non-NULL-terminated destination string. Use
> strscpy instead. This fixes following warning:
> 
> drivers/gpu/drm/msm/msm_fence.c: In function ‘msm_fence_context_alloc’:
> drivers/gpu/drm/msm/msm_fence.c:25:9: warning: ‘strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
>    25 |         strncpy(fctx->name, name, sizeof(fctx->name));
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drm/msm: use strscpy instead of strncpy
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d7fd8634f48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
