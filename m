Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F16573C9DA
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 11:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C480110E18B;
	Sat, 24 Jun 2023 09:09:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A9F10E174
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 09:09:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98df3dea907so31482866b.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597738; x=1690189738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iJR1qiOnOHItJJH4VOhUi4FNwu4+h9jh885qlL4HP0=;
 b=OT3cBSaqgJw4XxYazcpaRD93GXIBn7LdLztsnGLlMNIEIyOKPL1gZmj3j+HxgBttPb
 0mtbq5H1u7zAWmKBJW/f0KfaG/iOwrpKDdt1GUksKeFH8ZWYFmLRy4vi3+87B7dBvqhf
 0KeBi3ETipQyEr5aymal6vu3bybyt1J02yrnNhDwoNkpFuSnXguiCsRQ8Hr9zx040nG5
 OXUDtuxjgX3Zif51XMvuX7vtVHt+S/K65CKN/ukJmCw2kuHrhogat9TrHvRn3SrFUSDv
 D4uxHmPtbc92N5zinMsOWc6uhMl5acWHRMK0ydlgNuz8u4P+4M/RLEvht4pW01cBa7Os
 ZJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597738; x=1690189738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iJR1qiOnOHItJJH4VOhUi4FNwu4+h9jh885qlL4HP0=;
 b=CaJ/7nhxYyEzOUNzLY06CNF9FcWLg3J6vwHzCuzGywRrLl+IibwLrdFFf967BBmqeN
 OVm/FkhQgQLX/XofmN/Q6KoCTkUid8YrGsauLmBppU99LJB9ExFSJ/yOX3+4KiIEFLwM
 9v1Rc0UkX82DBM76g6ddBpo2vMgeCMUxmD/ApfQQxYWijwWZT165AiUbJEWm/cznWZpr
 Yi9p5j/zQGmti+jRU74YaoqImZFFZ/SYWWey93Vyn4Wiu+AAMexybqzX42XPB/VhNef2
 twiLWGWVfZ5H5p3nq9vdc2vezSIfXJOpoX6MzAp8T+WlK0TgOsEBj0HwBG7qqhN+dIaB
 uwcQ==
X-Gm-Message-State: AC+VfDxJT/NTGI3Em1sEqVWdHfDu7Zrs+qW7GjxO1/TlkkyuCTgun7s0
 AEGTJjEywdYSpS97FBX8Kgn4oA==
X-Google-Smtp-Source: ACHHUZ57vhhKgA2KWro0eA03NX7qoeLCiR9NZwED/O7dYzF3Ya0EjhnjcRnSJ+HMRT5ofjOczockxA==
X-Received: by 2002:a17:907:d0c:b0:973:91f7:508a with SMTP id
 gn12-20020a1709070d0c00b0097391f7508amr22977407ejc.4.1687597738687; 
 Sat, 24 Jun 2023 02:08:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a170906229a00b00986bf50fe7asm678897eja.60.2023.06.24.02.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:08:58 -0700 (PDT)
Message-ID: <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
Date: Sat, 24 Jun 2023 11:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/15] dt-bindings: clock: qcom,
 dispcc-sm6125: Require GCC PLL0 DIV clock
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/06/2023 03:45, Konrad Dybcio wrote:
> On 24.06.2023 02:41, Marijn Suijten wrote:
>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>> be passed from DT, and should be required by the bindings.
>>
>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
> Ideally, you'd stick it at the bottom of the list, as the items: order
> is part of the ABI

Yes, please add them to the end. Order is fixed.

Best regards,
Krzysztof

