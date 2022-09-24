Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D615E8ADF
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD4910E5A0;
	Sat, 24 Sep 2022 09:31:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C431110E5A0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:23 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id h3so2476560lja.1
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
 b=pSelQqH70MK7kbykGMMxDNVDHXmjCs9Hv4LFxAVPFP5PzdCM7SX1FJK1cRx0aNWLHF
 dU0FB7D83sewhPBKXqiOD7ZymZdauex6ohlwUMJxb7rMbJ1z/uMUU1k/zM8FnCLCysSs
 SODCDv0MNnt3x3mcnhhflfyywBBMj50er2x7MZ9IYAsbS9nnDQ/qUrWbslhe9CVGvK/1
 vyDUZNjoEN03oF/tXmW6auNz4gUUJ87pxq9YJKJgpZvoSpFYTJtKELPlNMjvkTrhqbu6
 hLmTvKB/Z2cC6HpvLsQPwNyGFJNY8iyrLrQToadhF0Z//QlfEzEwmQOWBR1s+PPsITGB
 FIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
 b=f9fLh2g5hq7hWFEVuuEOIm6V8m/i3xLuMwAz208PXSikBL3cM9xszdsRHXYRNC6jS/
 gfnD9nCPjO53eKqGeK3i9k0t0XqKeiK5tktFe1lNWCOkETQVKGGjuNZRzpf4lKvkNE/Z
 WH7z7l8/MgzqiyxJIiQn8/M+QUeRUWNVjzdd8s3TUIoEH/Ic+1MWOoOzsOJ+eFSUnDTL
 ftO9Boy5ki99p1u4AZbVGkAwubrkBcnswlFjpGuXf8rfsSWUa8mlAq5xu1CsMfYr7CbU
 zmUmjFjb5PuBHeENbRDva8Lx2wLrfCOPHFJjZoeh0e3C4FUkx33Pi5yHC0IML75jl32u
 01bA==
X-Gm-Message-State: ACrzQf1aYoNPpBVaSG/8C66ecsYj1ihd+xJHi1bMvIFxRG9oREKB0E0b
 WNwnsUHlYceeRcVlB1z5A+H0Ow==
X-Google-Smtp-Source: AMsMyM7hvEXNYUbMtrVnw7eFWevADIJedTdpXqSegKLMuLkyylWLkNZY+sF0O2C0paaRkava/DHILA==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id
 m7-20020a2ea887000000b0026a871ba16dmr4477103ljq.482.1664011883356; 
 Sat, 24 Sep 2022 02:31:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 x15-20020a19e00f000000b00498fc3d4d15sm1836099lfg.190.2022.09.24.02.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:22 -0700 (PDT)
Message-ID: <b8c37872-fe98-a66c-008b-748049dd8d78@linaro.org>
Date: Sat, 24 Sep 2022 11:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI
 PHY node name to generic one
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

