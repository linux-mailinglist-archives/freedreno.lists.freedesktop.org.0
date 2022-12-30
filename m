Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A98659A6A
	for <lists+freedreno@lfdr.de>; Fri, 30 Dec 2022 17:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31A510E058;
	Fri, 30 Dec 2022 16:12:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D010E058
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 16:12:21 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p36so32248617lfa.12
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 08:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GBbD6UJxbg5TeHZvm6bxZJed/H/TqNWwFVXvTuH++oI=;
 b=YuGLUyTlg0z3sWXGPKIe87R6tClSoUEotXhn0yxmvxF1WcLoL8KDnAa7iMezRL1VR0
 KrTpcFUnzEspHqJXyiuxm+bwvdj7qHL7fJQMRNjQZevRHtNOF+1Kmia0zBfGjucqC8ci
 xKp0AfwHXUYK8+JbwDiXz6tG2tgv1NLYCiBNOQ/FOXNM/3eFm/rK2aXujZAN96HdnTll
 Snl8z4QWDYjygcR45jTCNZANm3cFsHOxdZA/VpGnj2DvlnPvit5MA7w/zU9XV+1q2jva
 ZRNYowto8UFSOg8JsWDNgoTBaTF9rp6B2bGxRCMmP2q6QJDaVpBs77VWXmG5USPRTQeT
 jrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBbD6UJxbg5TeHZvm6bxZJed/H/TqNWwFVXvTuH++oI=;
 b=5fVOOqt/tjgc5IsiWo5hsw9s2QQXpeFBn9svqrIaDoAeKdVvBi7f7EFfrIz18zvGIw
 UynKHfCqUlf3NBoWpTZfuaBepiIwycWSHsLZ/0DK+sl7/b+CchJiLaTTMNgC8JCvMWpl
 b/e0KTTDse/8c/dq0wKEJvXrJCOaqsLbRqYuyngoXcDToUSwW3KXOavOgXQz2GO2iViI
 Z0Ikm0YsGhBLeBcttewSTAmEIwlBnsD7PHg6XNcPc/LX7JximCg/NOE9zfAMhMSLLRz5
 5Dyul3ayFRJWatopDoZIcs9MNvw6VmeRKwpzqFCuUzJ4Jpoh2s0SJmXQ14vo9KLQRTqz
 PxfA==
X-Gm-Message-State: AFqh2kq/YzpjowP+67+z77RxlwNwZQsBqbNgG/n/+ow/8k59qcZMVHjT
 MKsUwKqOD/O20vK2TwpctXe2cw==
X-Google-Smtp-Source: AMrXdXtvYA8wjxT8SRcJt+MfkDiV6OP17b2Fh0czUZwLZzNjAkGXbZD61rZlVwh+ZeU9wafo9PeAeA==
X-Received: by 2002:a05:6512:4015:b0:4b7:31c:7779 with SMTP id
 br21-20020a056512401500b004b7031c7779mr10401585lfb.4.1672416739493; 
 Fri, 30 Dec 2022 08:12:19 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a056512051600b004a44ffb1050sm3509314lfb.171.2022.12.30.08.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 08:12:18 -0800 (PST)
Message-ID: <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
Date: Fri, 30 Dec 2022 17:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_jesszhan@quicinc.com,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230153554.105856-9-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2
 interconnect cells
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/12/2022 16:35, Robert Foss wrote:
> Use two interconnect cells in order to optionally
> support a path tag.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 

I think you need to rebase to include:
https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/

On which tree/revision did you base this?

Best regards,
Krzysztof

