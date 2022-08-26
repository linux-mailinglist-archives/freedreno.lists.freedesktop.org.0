Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 026625A24EA
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988EB10E7EE;
	Fri, 26 Aug 2022 09:49:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BBC10E7EE
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s8so1073767ljj.5
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=fgD8MArf1fhW9WPJLzTNQiXID3sIQlI/i4dJ7hULjQw=;
 b=pkIvtxZgK8rMviwZp9ukD+I1XdMf6fNNSJlASJL+GEQDb2yfYKwmodPS56zxUTI/yz
 Pre9JxUwDK0jZv4S6/AnQX/lnZWp0dtvfaUlgjNv0xMh4zzdKTl0G1tUNVxQmV7m1EDj
 hyfinRvPUPeiUauxLpJZP5jakcTjshy6k9UtIdnCZo0ko9d7alKBWBr4KI7hZyct7/BZ
 OLUINoeVLck1b+MxE0NNd/VXhW9RaxB8ulWABWAHR5xjF5Kz9JMr13CKSMOFwFqHT+U2
 MpQXB0ojp8I+0ZxOWBjrVLjPkSmooPyoE3pT+9LTOFtAwqAN7twPrHtl4X1hs9dB8vUO
 OyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=fgD8MArf1fhW9WPJLzTNQiXID3sIQlI/i4dJ7hULjQw=;
 b=IoL9Sg61omnGljUZI/OnDP47tztuRcJUPd2TPbFy/z0sj+vOb32uaFuqAGheIuWZK2
 FGTNgdMEdREsQGeP95dzfLKviWPK5h8ZrdoPbqbhxB1zY/pl9OBhKF6VUFmm82KyliVP
 78AtGUrMvTNCezHFpj6ZYusqjBX4o5pFhohAXskuIou5clL+810X2fsb7lzmIVsWzNav
 2wMxlG77qNhwlTnVEq3drpLBo3GmIugLSbWQqs3uC9L+JwnATSFi4RJH46TP62vtGIfE
 OnVVh52dOEdbtm9NddINxZrkEDgNK7njEH+h2EwvIRa0YShOHWh04pkw+qCRUtCTyvc7
 /MPw==
X-Gm-Message-State: ACgBeo2bahb0lt0THhwi5kunsS9zefDER0OjW198vc3AHQ2JoZXJFp9f
 cpg3NL9TTZdgBO8QKM33zL9PTw==
X-Google-Smtp-Source: AA6agR7sEd1utbCeElTi22gwgYpzu+d48/EbFU6j2iMazTayKRbT7oIMBOoasmz4JE2cWrX5tHUG+g==
X-Received: by 2002:a2e:844a:0:b0:255:46b9:5e86 with SMTP id
 u10-20020a2e844a000000b0025546b95e86mr1976897ljh.388.1661507370397; 
 Fri, 26 Aug 2022 02:49:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac259ce000000b0049306939413sm319933lfn.211.2022.08.26.02.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:30 -0700 (PDT)
Message-ID: <568516e1-6a8c-34b7-7525-ba9cc522a465@linaro.org>
Date: Fri, 26 Aug 2022 12:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/5] dt-bindings: display/msm:
 dpu-sc7280: add missing DPU opp-table
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

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 57fd4f34ddac ("dt-bindings: msm: add DT bindings for sc7280")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

