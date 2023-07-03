Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E453B7465F7
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 01:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9299110E24A;
	Mon,  3 Jul 2023 23:02:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C99110E24B
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 23:02:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so7668327e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688425320; x=1691017320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
 b=sibiPYk/YJKgJiBGHF8C2gv7Orv9I7XefFQOV/sb/PxrndhfP9Zbp9YizegWG9y4Fr
 5XWLYeOXVwjavRSiX1PseOeffxEd4vP7KbSEdqTO0TYz10xHnpdPONC1dJBjEuvdcnvD
 aGse+zNiRl4W4qL0c4RZZ0MULPO2B4Aa9ktN421OFr/vS161jggrL+X2OaS8NGSR9APW
 s8iqA1JV5S9R1yow+ZyVKtb6xCze7TVxK+MZNYQ09jtl37vxSTZyY3PNMavIoNQkgFxU
 NebITzm5Mo/8NyIRLS5L+sM5DEYP61sHk93U/WZEW8/GUF3uB6U6/8FbwICfI0QUeSXY
 IQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688425320; x=1691017320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JYnjAjsNdc+08o7EfBrn0+tklBHBzj+VlOunjsVeIes=;
 b=H76or1HkQm2pfYxplWMxCHw3g7j4n6nln0UU+IkCgV/FGGDqjd6Xohepn/snmDDnIl
 +1+Jorc2FF/T87pNX9Cvo4XXb59MA/TUsAHeGhFX0qP4t2WQ7e/nuscLVINwHTrwcouz
 UUiOpa8haKRue01nj04mlRZ/kXLp1eL8sgPUUaioW8ikZxgV5DParfEFL3emAOCglX12
 4hBW5R35f/LsWhZElu81Nf6+lGg5TJk84DBmCZh/H9n1L+FyShAw6Cv4Lvo5jKFxii3w
 jwiGAH07uLkDbjBxHuFAdUznttsMs9N/EjdSaZaca+ZMHJjgcio99sxqixVxAb4Mwwg6
 pg+A==
X-Gm-Message-State: ABy/qLYcZLsC6fO6ZSzAGceSTyRFBl2kK0TUqHzqS7B+FYv4Vsdo0GBK
 bwkXINjBoyfMvL5unLqYkPwj0w==
X-Google-Smtp-Source: APBJJlFugmQY5xvSs/ktG8Zm+2+0PfQ9R6eeHqJiC2Wo1/jOi9JmJ35CadEz5D48JhJml5DGCDH4cw==
X-Received: by 2002:a05:6512:3f02:b0:4f9:b6f8:844f with SMTP id
 y2-20020a0565123f0200b004f9b6f8844fmr8008342lfa.39.1688425319700; 
 Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 y26-20020ac255ba000000b004fba6f38f87sm2134802lfg.24.2023.07.03.16.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 16:01:59 -0700 (PDT)
Message-ID: <654b0bbb-9dc3-b71d-b16f-cf6b1a327bbb@linaro.org>
Date: Tue, 4 Jul 2023 01:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Mark Brown <broonie@kernel.org>
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b93cb054-fd42-46e5-aef3-dc41b36a85f9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 0/4] Qualcomm REFGEN regulator
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 4.07.2023 00:59, Mark Brown wrote:
> On Mon, Jul 03, 2023 at 08:15:53PM +0200, Konrad Dybcio wrote:
> 
>> Recent Qualcomm SoCs have a REFGEN (reference voltage generator) regulator
>> responsible for providing a reference voltage to some on-SoC IPs (like DSI
>> or PHYs). It can be turned off when unused to save power.
>>
>> This series introduces the driver for it and lets the DSI driver
>> consume it.
> 
> What's the expected plan for merging this - should I be applying the DRM
> patch?
Uh sorry for not clarifying.. please just take the first two.

Konrad
