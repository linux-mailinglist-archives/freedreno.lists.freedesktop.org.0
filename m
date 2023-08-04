Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36ED76F99C
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 07:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC4410E23B;
	Fri,  4 Aug 2023 05:38:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB1A10E23B
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 05:38:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3177163aa97so1488370f8f.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Aug 2023 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691127479; x=1691732279;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rKJHgUf5ddA14twUxyItzEYK/Or9J0pJOslHgdqOc0E=;
 b=FgXduhVaasSnc2COtTCSq4I+u56MKgA9Bf6ww9s8FDXUujgLbKZKowbgpWnk6oVrCL
 CFkkU8byXFFs3bH7I9eQwkql1YkI2CT7j+hTyr3QAt5PVraLl0DkAP6SkeKnFLDleCAo
 ZzxUWR6EnFaqf+hCEIzHxODiaNV8PSPSsoRKNTd4BRpdibKaSxYtvoP0/JpGFkSF5Njt
 awTZZXAX0HSGL2Zp0856qIel59jAb7azcSVY7vwII5jX3Gc+CAWZzCxlBI5aA6CXyxlU
 iE23ZD1MYLKNYfUN60yXu7C3bjt+/L4r7Syz5CsR6e3g99PJOY6Gb+c4Ht1ktCa/3JoZ
 19og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691127479; x=1691732279;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rKJHgUf5ddA14twUxyItzEYK/Or9J0pJOslHgdqOc0E=;
 b=OAfANpc3G8mn0q+glainFCURont6ZL2kKzWd9t5UsAfbeYWYQrwuTeo8n2p4FFEvqd
 Avq4ttOxe1mWjQjHaiY3Khbpt1AsBqjUIm+QovJXkpD/B9IGeMd7WmOGMWA1/8o09fVS
 yShM4jC7ucFm0zjywhuADllUrv7P/rmJmIdgXLQReUgnKFQMfJZW6wow7BNvOAKQg91s
 25VSQHDUakcX4yiUNzxczGiKGOYzwIBMWQ8I0QcPDiBAGkTqOPsSrxFzJ+VVMajT4zRD
 kMFKvtSO/nMfLTU7sFt+VUcqy7oHXIeT5HoRdPuGTBe2JjKnh5GFnFzOOI4ruVxpGPau
 JuLw==
X-Gm-Message-State: AOJu0YypftNoQeRDVjzA3Ug/JggIXdC6+ZOQvF8KwqemkcnxDjCKz8Ut
 XcYSKN+mCRtnE/PYl+CFwwslZGJVmABcOqCgTzU=
X-Google-Smtp-Source: AGHT+IEZ7HwVhc6Z4hSjYNt9WbtkYqttxpmSchgCJL3/Yk6LoSMQG8mgqxRCFSJkSujgsjOAzR12Nw==
X-Received: by 2002:a5d:4523:0:b0:317:5eb8:b1c4 with SMTP id
 j3-20020a5d4523000000b003175eb8b1c4mr564622wra.2.1691127478946; 
 Thu, 03 Aug 2023 22:37:58 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m15-20020adfe0cf000000b00313de682eb3sm1545617wri.65.2023.08.03.22.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 22:37:58 -0700 (PDT)
Date: Fri, 4 Aug 2023 08:37:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dmitry.baryshkov@linaro.org
Message-ID: <75bd8b68-9e7f-40a6-9093-57e39c6e23e6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [bug report] drm/msm/dpu: drop separate
 dpu_core_perf_tune overrides
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Dmitry Baryshkov,

The patch 6a4bc73915af: "drm/msm/dpu: drop separate
dpu_core_perf_tune overrides" from Jul 30, 2023 (linux-next), leads
to the following Smatch static checker warning:

	drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:295 _dpu_core_perf_get_core_clk_rate()
	error: uninitialized symbol 'clk_rate'.

drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
    280 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
    281 {
    282         u64 clk_rate;
    283         struct drm_crtc *crtc;
    284         struct dpu_crtc_state *dpu_cstate;
    285 
    286         if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
    287                 return kms->perf.fix_core_clk_rate;
    288 
    289         if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
    290                 return kms->perf.max_core_clk_rate;
    291 
    292         drm_for_each_crtc(crtc, kms->dev) {
    293                 if (crtc->enabled) {
    294                         dpu_cstate = to_dpu_crtc_state(crtc->state);
--> 295                         clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
    296                                                         clk_rate);
                                                                ^^^^^^^^
Never initialized

    297                 }
    298         }
    299 
    300         return clk_rate;
    301 }

regards,
dan carpenter
