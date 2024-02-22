Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71285F38B
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 09:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3610E8B0;
	Thu, 22 Feb 2024 08:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vIp23bh/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70610E8B0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 08:55:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512be9194b7so4634866e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 00:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708592133; x=1709196933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
 b=vIp23bh/oQHy02YuFE5we01egJAmOr2R6ULXBCABwq2/k3U6xOt7EzpthPEtGghs1Q
 5kHRI4MO6TkidoJS+NXDm5PPc1LOLuy9SEnaDppmGj9nAU9Zi2nBNsa3evhau9j52cbX
 O3B/0zqmS0gX+smrY8sUmLm9FaX5GzBkEvhd8Mz8YY5lALYVP4WiSBnfvjzXQM67ZlXO
 oR8Ay5XsATuR/TaVSseYaihzpK4WlMn1srhXnWmS6SQEymEQtqGaoEdzgHFy6EHoSgeC
 DYye00oyVLIFCJAXTrWIICcHAmxYo558UCGTkq1ysoF58olKKvBBsFAvSxicat09RJDa
 Ltog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708592133; x=1709196933;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
 b=gGEqx8mvcstPTQR6LLxACnUGyay1ZMr7EDTpieC8VZx93JHkyLkYSBLpKMEn+OuXys
 WamZ5CAtAyDu9kdsQCj+TKJCTLN9tVm4h0Dm9Q5l9G0KClZNWiX2fBXap9ftw+5is/co
 Iku+9Phb/WADtScFy6HXWAPe2FexMrUGupC3gGN0iF5ZsaiAyGFdtchQTI5r6IRzjZca
 tzlqErjgC6A12hauw5FuM61Ib0iX56E1luKt3TJGJuCJtjjLUq5gD5auly4xLwZ8TGzX
 mjv0fz+KvZ4vlHWvlt02wc5LQeD6MhjW5mQfSj4ZbFhvexbiwLOtH0N+TQ9T2wI1OXgP
 I49Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQrD/FMS53nFoVMWrnOm2DC+/Ub3RKJlgqVb/JtU8jLS+DYrQBj9Jg+jdChM3CU62ew1ES3rcrvP4DWUv582FiyzQRl+aG7HWsdxAyDnBc
X-Gm-Message-State: AOJu0YzsPnzCH6U6Tt2lARmivFqTknWA4QPZ3+aYlzOreljIDjcR6JWN
 jSWqh+8KOUN+jPhXPvsRedfOy2vrgrVLYAFwe9JLmjwfU73JK0aRaDEYS+714PA=
X-Google-Smtp-Source: AGHT+IEtIiogO1qg0DsIHuHZDJdmbDgFoql2wOjjQ0dHxEtTw/GBno7cWP1Jf8NhMK0pYXBLxrLr8w==
X-Received: by 2002:a05:6512:128b:b0:512:d8fa:a0f2 with SMTP id
 u11-20020a056512128b00b00512d8faa0f2mr1752378lfs.22.1708592133207; 
 Thu, 22 Feb 2024 00:55:33 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl.
 [87.246.222.6]) by smtp.gmail.com with ESMTPSA id
 b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:55:32 -0800 (PST)
Message-ID: <dcbf0e04-0252-4cda-be1e-ee4c707017f7@linaro.org>
Date: Thu, 22 Feb 2024 09:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
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



On 2/22/24 00:19, Bjorn Andersson wrote:
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
> 
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
