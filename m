Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3004CE833E
	for <lists+freedreno@lfdr.de>; Mon, 29 Dec 2025 22:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5972B10E6AB;
	Mon, 29 Dec 2025 21:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mzw5rElC";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RW+k8ws7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE34F10E709
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BT9udmF3777454
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=; b=Mzw5rElCstkRJJ4y
 RJzTKp44R/e59QZKa1rMxyP2CVNgkr2hgTWKUHlOm8SWpDvdGNKAIyYeaMd/UELt
 7DTIO9yNc9c4rsUBbH4ZdXIZSiRacLwma6j2unUJl9cljwMPIU8a2m2CYo+lO9dV
 lwt2HqCQQOCPxHVwiPWSxfgZCjsMgHbsXmdSOEta1OsDVCnZfTZInm8uOtPcRwV+
 HBJ26yiMA14VjdYVCKQ3uHN5pSHNux5uQHffKm7xxR53RJ83fgzG1LEQ9wx0h8u3
 W5JSn/xeZ+bT93liCayUoTU1E3BLQ8mvnV8izOqB+C/0ucesoLeADEKUs/dyNlcT
 Bc8nXA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc8ytp00-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 21:19:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b8a12f0cb4so10857104b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 Dec 2025 13:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767043168; x=1767647968;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=;
 b=RW+k8ws79fQ2c+fZr69gqH34B1jV1k6dAj0ZokZjq3PtTO5S4CPD7pX+Bf1C0TIxn/
 bngeQOIfbOJ2ZAt4+1HCOXu75iRLscd7riW8ehXU/ofD9eqCmH0S3FcJPfBAN/qjCiWr
 7w5BP2pRglIFcbq78CA8Ddnhh91ly88xx0n/ZQVBFaZAqIJL59bhN5Mm/I+7ZPQ7dV9S
 IdZyp+YjVhFc2comTd/+RqIGAGAGouGhaOybm/beRtxpsD7GzimbmES0mJ1Lb0FYRU9W
 hpZbYyKdZ1MRCw+Mq7XQzkM5y+GZ3wXNtE7nMytEa56C9+UGC930k8unzX4iWCQsD5ru
 edcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043168; x=1767647968;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZpBCIZzQrlhqAZnvW6IzAsAlvQ2lYCsIDcnMGn3xCmM=;
 b=GA729e0fQ/lSblw3RNJG7wMUPZyMsPH56gO2Kn4GkH7NoDH1REfGf27PNTiaRy2ifw
 +W8D2pQw2zRAWYIXUFxUc84UY40iBNCULlrXVJMO5z5CRyz9RAhQGQ44yES29aHRYRxL
 KD5UB7s/OBYTDF/OeY1i8XXT26E4gj63csao4U4j2a2XuqZ0+HSpBTLOkJ/pVPOcDgKh
 gEYtYz4H4d/d84N5Vgkt0Jyuznm2CDMt3qI9pn5XAYE67kcomP1F9B26vOD8Gdos0CQX
 NlOpW19YoM7/9shDL/NQJKosidUmbNAFTCgkSgXc1tQCWpj80gaDJRN/tSCAWyyiPv5E
 5QRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp9m1JryIyKr+s5jo6sFS8K4ytImsY+w0qxS1RLKHyng5aeijNXcXJUrI9l9r6hIJEfKqDBIV06zk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz8Ay8QOF6qO5g+Fs99bZWfaqakv2OH2kLyxiDNHFeQymw0mcn
 UtcJwiRUIGwkD92R78KaBdLFlytbAp3d1V0RJwmfdZSMhmYd8Fh1D6G8PcyifWg9RPOExwT3aOr
 cy1Ano6xQfmzP2MkkPnuJjVnqJJt2YMCkdmiYh6Sc+j8kSi0xXwaOilzplZeUSRxevl8iKTA=
X-Gm-Gg: AY/fxX6bpuBKcKPQb3EsrsHTA7FcgUSpSi19779b535XRWeLWRMDYrslCWuoFerkdr6
 GKGxiHnlalWWohAXB/cWmeY6pm+XIXMTCnpAYO5qtxUoQoZdR7qPHFWW5LoqZ9It5FOq4U8+W2Y
 pZDDpq3fgCqvUZBuVlc2D9kOvNWvXzah/9jlAekbyxDhb6uYTncXx7uF1l4IMwIheypdheCxFbi
 Fy7PCd+kbI+NW8DZVDOeMdxfnq+0EQ57wknvK3bpAOGjI2GtROS3+cKKCC9Nw7R0gmkyNsEKClI
 iT+q/CwsewZoWfS7N3W8fuep8yMnLDUxE5XZ/NDpiaINtjUr/9ewGuZg+stINtN8gH8XIOvjyOR
 lvcjLY2eqRzV+kB0gL+dv2c6fky3CVsFdeQ==
X-Received: by 2002:a05:6a00:90a2:b0:7b8:10b9:9bec with SMTP id
 d2e1a72fcca58-7ff654b8185mr29097582b3a.19.1767043168204; 
 Mon, 29 Dec 2025 13:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHObsOyE0pNTP9yuvY4xceFRRd+xJwU6ZcRdjs/f/UrixkkJEYeWSKVBpetD5YZmRKunrqPzQ==
X-Received: by 2002:a05:6a00:90a2:b0:7b8:10b9:9bec with SMTP id
 d2e1a72fcca58-7ff654b8185mr29097557b3a.19.1767043167701; 
 Mon, 29 Dec 2025 13:19:27 -0800 (PST)
Received: from [192.168.1.5] ([106.222.228.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7a843ee4sm30860986b3a.10.2025.12.29.13.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:19:27 -0800 (PST)
Message-ID: <cfa16bc7-9a27-4fd5-b1c9-fd239f529dc8@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 02:49:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 0/3] Add missing CX_MEM/DBGC GPU regions for
 SM6115/QCM2290
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE5NSBTYWx0ZWRfXzcZ8FmKCuqL6
 YsCn4VrGLsd4TglWjIglTZeHbkf67Urbd49HSH72e03LQXlvTF7fPPu/wa1JDvcmzal04x2dIjQ
 +wSJvNeGf4Zj9fRiTJffiTscdp7WYymtVLcGrhLb89YPgvGah+tZKJoNmyOxRP629Ru7jMnyd0h
 jzzc+QOHp5eWlsg4m/FcOD25e93ge3UO3fS9P1GCqi0E+s5edoKOi1rfScPehDM8tS/gSvBH5hW
 QUCFLs5v+zaMwSa8HU1uqOdPe6CoAoJhrDE/OSByk3fkfcj0YSzSsVI6x812ID7XEVL8SxZ+bXa
 RjtjAT4rfaSHWft7gFpUeVw8XtDgVCUvsf54TS+nkkMVa462uV3Qx9Ld6xFBLR+faTBLBpeVAQ+
 +qjsjLmz6eaK+9gkBj+y6due2S84iVMoV+VwsBUlao8rldfOwkNIaGc0Kp/bZMRUjVdYTwFL6ee
 +jW5jIY7NyxSINmDi6w==
X-Authority-Analysis: v=2.4 cv=cP7tc1eN c=1 sm=1 tr=0 ts=6952f060 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=DNOyb6/IJtREwcjsjFyOSQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b3iq9OUVpPj_UNejB_kA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 1EaHuAnmELpviJQFGxuCHxVXBNkfkagf
X-Proofpoint-GUID: 1EaHuAnmELpviJQFGxuCHxVXBNkfkagf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290195
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

On 12/30/2025 2:17 AM, Konrad Dybcio wrote:
> These regions were previously left undescribed, fix that.
> 
> Compile-tested only, the driver shouldn't break though.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702
>       arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
>       arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

For the entire series:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> 
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
>  arch/arm64/boot/dts/qcom/agatti.dtsi                   | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                   | 8 ++++++--
>  3 files changed, 12 insertions(+), 10 deletions(-)
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251229-topic-6115_2290_gpu_dbgc-79822622b58d
> 
> Best regards,

