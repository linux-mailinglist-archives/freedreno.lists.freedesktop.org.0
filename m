Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3C65A621
	for <lists+freedreno@lfdr.de>; Sat, 31 Dec 2022 19:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63FD10E130;
	Sat, 31 Dec 2022 18:56:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4C010E129
 for <freedreno@lists.freedesktop.org>; Sat, 31 Dec 2022 18:56:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g13so36177758lfv.7
 for <freedreno@lists.freedesktop.org>; Sat, 31 Dec 2022 10:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=492r+yHdPMIoILRLNSFxtqbe5eiM6CMIAFGWnVFQ6z4=;
 b=DoHcuI1rMdXexe2kY5VzaXWPc4wCEoewmgZDGedv5XM1Vt7Ue8EhfdBPHyPGX+OpHG
 8cisv7vaV9DNF3uZ4/zBhiP9MAGmJQiSDx9RZzs0E65oXOOcJFDzQ7cyHzfOh99jDhkv
 403Ud+Xe/jeoj1X+QVBGmHnPgHYbwPeBSyxyLoglfovbGmrkofH9JVyTLeyrRZkhFeSB
 2p3L2Wrgdg7UCa8vlvG6iyEPz7P4e4aWCiMYraoTxXcA+ngKJsCiMgntpKkrQhx1hQab
 sHfNLHZGmIa8UQWmKDXWi+/XC4cAxMpixyJpriGHZzmFcucTSShVy3cr/gVQyaM2UhC1
 bkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=492r+yHdPMIoILRLNSFxtqbe5eiM6CMIAFGWnVFQ6z4=;
 b=w5L20LCzTI+FjR3vKSK/ji1i1KOv5bn85n5OwpckFS83jqVb+fKZswpNIpyAslxk5/
 tfmvWmO0rQlDGEtYwyGPVVsCXNriC2ttfZ6zVqhvcOWHsaw0pvDE0CHazEpffBLgDOEH
 Xqo2OxuM1BLnldqV4l//HCRPuABa4FaYSVVBfeK7a3heznsffutSJ0CMIYKRRI4mPc+R
 fep+bw+lxzsXJ+guB11Wr3hIOcQx/WvQAjY21ZarWubr+O+II6iz9SZKvQKSmAnF0vPL
 O1hVgVE87nHq52KX+K0tgv2BJCGhNZoCoVOJTlOACQXimFeuqo82ANhffrjRLSfF7job
 nByQ==
X-Gm-Message-State: AFqh2krQZ9bms0/xaGl3dEvEVlaTpU2/qw8qOWNy/OiydhEbxFRQVRF6
 ZUz9IXzgXZl6Gs6t0oYNdFnQgA==
X-Google-Smtp-Source: AMrXdXu8eL8KxwSARuXzEKBEb1u2dlv6u1JJjlQ8Yg52EBl26UBeSJbZIkU3p1dtStt0qQ3KEMJOHA==
X-Received: by 2002:a05:6512:13a1:b0:4b6:f0ea:4f49 with SMTP id
 p33-20020a05651213a100b004b6f0ea4f49mr11080983lfa.9.1672512980943; 
 Sat, 31 Dec 2022 10:56:20 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a056512075300b004b53eb60e3csm3663570lfs.256.2022.12.31.10.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Dec 2022 10:56:20 -0800 (PST)
Message-ID: <55a1f2c5-8ef8-4291-8c95-49abe2637007@linaro.org>
Date: Sat, 31 Dec 2022 19:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221231170532.77000-1-a39.skl@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231170532.77000-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm: dsi-phy-28nm: Document
 fam-b compatible
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 31/12/2022 18:05, Adam Skladowski wrote:
> Document omitted 28nm compatible which will be used on MSM8976 SoC.
> 

Commit msg is not entirely accurate - this compatible is already used in
the Linux DSI PHY driver.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

