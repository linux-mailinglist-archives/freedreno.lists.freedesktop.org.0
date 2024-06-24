Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C5914F54
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 15:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984910E083;
	Mon, 24 Jun 2024 13:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jnVeKmgg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4350D10E44C
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 13:57:43 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so3896553a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 06:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719237461; x=1719842261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IHD4jJpcuG4tMgpp91267iJ5OoLxZWbXVFw4XaeFi2c=;
 b=jnVeKmggZ1mDo1B7XZHTzJc430KrzKl2rTEPU9Sx6tyPlfgvYbEo5BrECMa2bwk+em
 hjcC98z7LnKU75CFq09wkJnlFvkBwnLcnHfVwKb/e8OaSfzJ8QE/7ZOBzVJUxxcg6gXa
 1k8lrQBQ1dC/rmnzYq3v00egFIv1pf+4gjMqHQch72rwYhJJXhRIIM7znwRjraQfntdQ
 SvOcFjrK/FcZsiTIhjydlWDqZX9ySPBRF+EvNx4pNIcy/xcV7oXD/qKir2DBVMgEaIlm
 9l5LjcrQdhjzHt33TbO4XEuR3ORWzz1527i5z/aZaQlkDAPa8fER96CoKZxsVSz8umVR
 TGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719237461; x=1719842261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IHD4jJpcuG4tMgpp91267iJ5OoLxZWbXVFw4XaeFi2c=;
 b=GM+cTNzikARHH89SIicLRgOgvLb09ykOIe72b3FupuORNM57hieGUfnHcsGnzCC+46
 p7nkgCElR00snbwJM6/CATdb9gGsd/PjW5FlYHVNBNqt7ZAZ99lDdcO+AI0+fNljvIfZ
 LuLZ5G76AcWrsYNUlDQPNIg7cn3HLVfmhioSH7KaP/alnEXRGQhjJAcuud5mmNKZ5/H4
 ScAVvrxvC26Z96OpZefooFY9sNNurYNF+VnzGeYlrmqavPtnVLEWdQ0Acx+jHoKy4Sw2
 2Y5CvposbNKCDulk0FD4c01WKKAN5M2Z5hTPMneQFKE7hubBcyhbyp/2zG/JHw0BwRMs
 Zjag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4iNpqXDOZQ5jGhbzfdJoU8EoTbzUliZvWUj/H+6BZQArlczBWxtR55ByT9JkRuILzwensgA5viA4Vq4Bizk3wAOF25FQc0OxBtA7nwVca
X-Gm-Message-State: AOJu0YzcRqqf7YQ4N3AaGXXlH1Crv9fjT/8iAYcAqJk3WBf8wOlPr0A4
 2QCYEEX6t7bEwfSWhHk+5BFOuHhT8OrrNIXiqU8eihSE22QxlNesdI4VWCW3ULQ=
X-Google-Smtp-Source: AGHT+IGpGmgITj2Vbxhko8ZELCw5TU4oWE8gTzKLF+hMftNzpJ304FkSkyvJfotXe68/KgaWnf31Rg==
X-Received: by 2002:a50:875e:0:b0:57d:4692:ba54 with SMTP id
 4fb4d7f45d1cf-57d4692bb51mr4569953a12.6.1719237461074; 
 Mon, 24 Jun 2024 06:57:41 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b?
 ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d66b04378sm405692a12.38.2024.06.24.06.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 06:57:40 -0700 (PDT)
Message-ID: <f5ef4e3c-66e8-4833-86bb-c38658b923ae@linaro.org>
Date: Mon, 24 Jun 2024 15:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240623110753.141400-4-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/23/24 13:06, Akhil P Oommen wrote:
> Add the necessary dt nodes for gpu support in X1E80100.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

[...]

> +
> +				opp-1100000000 {
> +					opp-hz = /bits/ 64 <1100000000>;
> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
> +					opp-peak-kBps = <16500000>;

No speedbins?

Konrad
