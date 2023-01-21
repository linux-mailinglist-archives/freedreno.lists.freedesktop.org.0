Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A95676535
	for <lists+freedreno@lfdr.de>; Sat, 21 Jan 2023 09:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CAA10E1CC;
	Sat, 21 Jan 2023 08:47:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D4610E1CC
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id br9so11272595lfb.4
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
 b=W5owJGCIo19xG0s4TWPnTP5L2WRmNRoDLz98R8+5Ee3JtEa++A4mEiwOIdqcu1G+WY
 1hIPpzdDTyQi6YpB047N9YC0Y1e2qZKb3Keh4rY07d6oF2Av3y3pOkc9DnSjLrYPrp6P
 fx5h2mN6RTcwydiP4fBM3KR7PZn6y0DStj0kG91UK9ZOAn2euxr8tXEg+52SmO97QUAt
 J4eWvHbtEXZtWFh0Qv9XJoBRujX59h737j+hkTT5/Ee/d0dyq0TDZZj9H2einZWHBDL9
 jlBMe3MKNYm3N2mWQ9K8SA90x/iXDg4ohZ4fv19TjDYkL3T3y+J7qpT6Q2DP09r5PuYS
 NH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUIakY5manILdEo4pQ4cOFFCkXw/ibly5tWVD00hd1Y=;
 b=77wc6+yiMnQ3jp5z4iYAZX3FwWoI+tjQ0chvcFQS5mNKx+tXCIj+G0kOhlGMpqTEBb
 Qw/z/oCNG7V15zsAM2sCuwbAhVxJev7q8m2VynHQ/6GkuJAm+PpllfyqZuCiv/RvVbxk
 v/gX/zwrJxhyH1LOT8qTgSvT56uscgupZfl7Y9ztnqkt9z0zMVQS1puRCaLqCF00HUUZ
 8B78KYsaldi6pe6bsvGJGbRSGFw3TMIa5n7JxZz3Ewpll01YrEZ/+f/CaqGcAdwGpTlU
 seZjjW9zZyYTvdhA8lO4A6ZskagwO5uZFIpKkj1z8EkzXrBNRIId9leztt72z/+NVxYj
 mJlA==
X-Gm-Message-State: AFqh2kqvc/CWFpM+7IIpVRe0CA+LX+FbS3EY966JGjPPanneHqCRv1qX
 ncQapicdnSqUUyOJ3j+Hef9QIA==
X-Google-Smtp-Source: AMrXdXup3aeZB7gxcaRq1cbDz6dQNOHgNRDof1U3LkTjlihG8wz/4mKtuTiCJJ7YlMFIBXiCMWag6g==
X-Received: by 2002:a05:6512:1046:b0:4b5:2cf4:cc1d with SMTP id
 c6-20020a056512104600b004b52cf4cc1dmr6256085lfb.68.1674290862243; 
 Sat, 21 Jan 2023 00:47:42 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm6234855lfu.188.2023.01.21.00.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:47:41 -0800 (PST)
Message-ID: <f324aa87-8df9-25be-d6b6-6341460993d2@linaro.org>
Date: Sat, 21 Jan 2023 10:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-6-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-6-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/8] arm64: dts: qcom: sm8350: Fix DSI PLL
 size
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 marijn.suijten@somainline.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> As downstream indicates, DSI PLL is actually 0x27c and not 0x260-
> wide. Fix that to reserve the correct registers.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

