Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6771AE45A9
	for <lists+freedreno@lfdr.de>; Mon, 23 Jun 2025 15:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49D410E141;
	Mon, 23 Jun 2025 13:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DK7GbNpc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0AD10E141
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8jjQv024219
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=; b=DK7GbNpcZaFHiJ63
 1jj2VqudphMJnRJdIYUaxmX7dxhdHWTIY0OS2nDiN4a61RVr8cu89xcRyGdgmRTa
 GhLwq++sMu7DgR70uzwptTFprZjMz/Ah5WaMes+sDFnu9AYuO3BOB8lbeI5dP24I
 RX8mK20MwZDrbp6KsLUZXEiHnJE0PIWQWunUWX0z7klfvXVz7Llg8dnov2KLu//P
 AQA3TRgjUd7dn/XdqX+VurjV5xErBCBM0sCuSEgHXpYH9YVSqtqjcXSwVSgFf6FP
 PHUzxQ2ntcw78aS+p7BIhuDo91BrTmR/Y+yL0JOHZ8tNKYxDh+y8tIlTYIn7ILCu
 Aa6I/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmjfjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 13:58:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3216490a11so1456634a12.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 06:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750687114; x=1751291914;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gVPZjTtp1XI2FupP4oz954O3iw9aZ3hAniyWNapzx64=;
 b=jYNl858Fp22IvYaNmoroAV1L2TNb4ATCX8M4CsLp1JdQa27UQOAAWs/ntk11XTNiqp
 VTZhR7THUr1nhSLWcNnvlaG/9NTD9dmdkyDP69dc/F5ZsM9KkhYVi4RqfjjIKQzJou0n
 Xt3kJ9l1PuAjTtcWBJ/JAfJPj0wN/ZWyURh2R09X+5amlgp8o8UJxl+zY3EhcMVfmS1W
 3t6qgNnMCshyN++AJ3Ao/dxfV8B+pz9tBZb/aP5vJqjQS9G4E0U3pNUh32keEgKezCca
 5hfa2Hum2W7EFxmNUsuQOWxAC52uaA0pcjiBCRFFZD04Pq1vJR1TkA8ZpRtJpOWGA9ai
 5Fqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxv3U/5KIIlT29VIbuS4FMHGiaD0oVt43vfVsUz+k3xpkCX+s5ZPZCeRuL5gNxlm72n441DZsbqJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3tMnVvn9wfg4u1yGbuiUQSXtdTfhc2lKhAZKDgvebaXKwUpzm
 urB/4a0q/0qHPGur9QZvp04cnz4kD9gNFmYdaL310iTI+XEoIFW/BDAbjcojXkpUpZiQVVHqjOi
 hV8CXZ8GnpABPfm5m+6O7QmYpAZZMUWsyvvKnj6GM+jFFG6yPs+MhyXvZlWcZZva3tIELcgs=
X-Gm-Gg: ASbGncsh3klSCWyhtlVQtSbYlHPn0OeedNQ0Jx5ZsU5oGWQI5eQhRL10e0VNpzHeAde
 L2+ueaogkbJ3vyFM8wOFM86R/ISZx76LVm9xooYLGPgJxmPxGrRqSm6EunwqHK40cC/yW+TDjOm
 /ERVySHXuasBfvxOBiB5ijMSANRT6/jYuAPh8H1cjXEi5EevGkms2d2SUhDz5JYswkgIOLKN2zB
 FRepM0DmKk4A/01yKNLMcAl+qXjnOsR8+TWSmn1LQN8iKXL+LJjmoJ3Ja7/25lTBixgbRDD1G18
 veI8/x/FL9LinIoFgWgsQ9qorcUMwlMhaG6xV5qEDg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id
 adf61e73a8af0-22026e3fc69mr18664052637.9.1750687113762; 
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVl1R1DUJMadEXAlc5CPHNyyosQFNPkLwlX/IE9EL9s6zL6fnh2dV9q0vTc02V0SmdWqoDwg==
X-Received: by 2002:a05:6a20:258a:b0:220:19b7:9d6b with SMTP id
 adf61e73a8af0-22026e3fc69mr18664002637.9.1750687113387; 
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Received: from [10.204.101.81] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a66622asm8539213b3a.137.2025.06.23.06.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 06:58:33 -0700 (PDT)
Message-ID: <e8653c35-d6bf-4992-9edc-414309768bfe@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:28:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
 <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <66094c33-07bd-4621-b49c-b29a0270e002@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qbemWWPVDEzjCl-kJwcUX7X7HdDjBaZZ
X-Proofpoint-ORIG-GUID: qbemWWPVDEzjCl-kJwcUX7X7HdDjBaZZ
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68595d8a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=Od58GZWkWy8WqyN3Zg8A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MyBTYWx0ZWRfX0kpOsVAbnk23
 JptUHwLnqo/2B4uoMEFfW2yCFkqKzRDLpS4Qp2rrlVS8JrchZyTIgvgpBvFsKQfRqGcjX9AtfvK
 +blxfKfOVK3u1fjHq2BX4nHN4ZAF56ZOfiKHhajYAefcfw9YD4stIDI6a/QYNhr7FG+nyuOEt27
 cwkFcfCnlHW02n4ITPjqOfxOU6oWqdiprUSBfBkqNfrkxdaq1u1SfgDKfO7aoOsBmPIRinSk8Ws
 EjclAV12cMmgy9g8AUklkwvjfpZ80b0RcEepHugYNuj9ZYxdObBk/yXlGffSPXjpC07Gau53OUy
 qqxymYIxRnleBvMgsv1xKT6PK4hVA2JLGHg4IVLEBvIcGGk60RQX3a350GknOGBKC8xaJyz+yJX
 L/TpEPAwZLuMJMWqT9zSgUc6+9ztEPgktlgx3W4o70sdiuir0H1QIdX8pgzQ7rNmKYVfFHyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=698 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230083
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

On 6/20/2025 12:39 PM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:54, Akhil P Oommen wrote:
>> In order to enable GPU support in X1P42100-CRD and other similar
>> laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
>> as a module.
>>
>> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Defconfigs cannot be tested really...
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>>  CONFIG_CLK_X1E80100_DISPCC=m
>>  CONFIG_CLK_X1E80100_GCC=y
>>  CONFIG_CLK_X1E80100_GPUCC=m
>> +CONFIG_CLK_X1P42100_GPUCC=m
> 
> Not placed in proper spot. Don't add things in random order, but follow
> savedefconfig.

Ack. will reorder.

Btw, can this patch go via Rob Clark's (drm/msm) tree?

-Akhil.

> 
> Best regards,
> Krzysztof

