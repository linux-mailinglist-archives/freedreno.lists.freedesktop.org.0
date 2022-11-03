Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E79617F42
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 15:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F6010E5FD;
	Thu,  3 Nov 2022 14:19:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A61D10E5FD
 for <freedreno@lists.freedesktop.org>; Thu,  3 Nov 2022 14:19:12 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b3so3095347lfv.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Nov 2022 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eQeJmfmldXG6hvj59+k+TbhmV1qXG3RlPlcNF3t/Ui4=;
 b=eIfFSn41vRIjqtDk+mjUsF7IHFNarF4VsRCOuE8POYhXnp6oyBT+6h9EQ1bjtm5BWh
 AZ+EbEpHlwSptAfm8e1snxWMK+7TlKekN7dEgqanRoSeyPN5aTtMofJ13dBGwQsr80Ez
 wBcE5Jn9tDj00EqMtqXabzEmRFMzQ0WOW9aavZ0tJ/f5n8H0HzJLt79JwtfTc76HeF36
 TKy1YClxtnIW6Dd/gNcrQBanCHacDuJsOzBzmTKY6dyC8+fNm1Zj1cWneI9kpuL25iyv
 PgnXfvXtdFp0Mbb5x//hk1sNCLRL4BpRs6BfgqjR3yNsSUQbyeYjSWa41lJ7Zjeq9GG/
 iakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eQeJmfmldXG6hvj59+k+TbhmV1qXG3RlPlcNF3t/Ui4=;
 b=Ijgr++ihct29oMSBzzBrZoX1vjKCqVQHb4KDKY0BBohfl4RMSjMMzl0zbe3Y3jehVP
 ry6uydweMtvgkFEdBXiun/zybBtvUr2O1yW2+zjZW3zs35X3ONBa+NRDC1RyKwKhDn7j
 E8wGOlOKXBW0RfAC1/n42rYEUppvb7qe6IOwWify9B+hTGFB7YdqHAdKugmsL5uy67l2
 nPn4L4rWTB+QllkGxi2aIkMpmJKQM14hGkSKnNWSD/luLCdP0d9y93Eu2Nmlj6x/Xidn
 KKOKpIgQ+sXH3qRcLt048PFZ2juM+y4XB4CwH95CFEtyql1HyOY2mzn9XJkSFsJA/Rl6
 auww==
X-Gm-Message-State: ACrzQf20vGmcWSPxqvJ8zfJ0+cTAj49sBTIffJlmIxF5KuOzb6F6SlQ+
 N8MtyMLucNH7Ha7qp8zEY40rIg==
X-Google-Smtp-Source: AMsMyM65B2GojMWZBZ7SW9Nj3gk8ZeKbb0JxUBUaGHgAfQk1+agMmGU6PEhntoiaifEbaTv7V4bKUQ==
X-Received: by 2002:ac2:4842:0:b0:4a0:53a0:51c with SMTP id
 2-20020ac24842000000b004a053a0051cmr11288589lfy.202.1667485150143; 
 Thu, 03 Nov 2022 07:19:10 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a056512061800b0049876c1bb24sm144454lfe.225.2022.11.03.07.19.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 07:19:09 -0700 (PDT)
Message-ID: <b1aea0c6-1f62-57bd-3ea2-6e4334e1003e@linaro.org>
Date: Thu, 3 Nov 2022 17:19:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-10-robert.foss@linaro.org>
 <bbce3d37-019b-a652-4f1d-18fb9493f7de@linaro.org>
In-Reply-To: <bbce3d37-019b-a652-4f1d-18fb9493f7de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 9/9] arm64: dts: qcom: sm8350-hdk: Enable
 lt9611uxc dsi-hdmi bridge
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

On 28/10/2022 16:56, Dmitry Baryshkov wrote:
> On 28/10/2022 15:08, Robert Foss wrote:
>> The sm8350-hdk ships with the LT9611 UXC DSI/HDMI bridge chip.
>>
>> In order to toggle the board to enable the HDMI output,
>> switch #7 & #8 on the rightmost multi-switch package have
>> to be toggled to On.
> 
> Since this doesn't look like a default setup, it would probably make 
> sense to move this to new sm8350-hdk-hdmi.dts with the comment regarding 
> necessary switch changes at the top of the file.
> 

Please excuse me here. I checked the Lantronix site. It clearly names 
'Optional Display/Expansion board mates to DSI connectors'. So, you were 
correct, the HDMI should be in the base setup, while DSI panel should 
come as the extending DT file.


-- 
With best wishes
Dmitry

