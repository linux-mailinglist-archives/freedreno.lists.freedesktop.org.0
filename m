Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F06AB459B
	for <lists+freedreno@lfdr.de>; Mon, 12 May 2025 22:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318610E4A7;
	Mon, 12 May 2025 20:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmdosR2w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451DB10E4A7
 for <freedreno@lists.freedesktop.org>; Mon, 12 May 2025 20:48:15 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJeDUu011347
 for <freedreno@lists.freedesktop.org>; Mon, 12 May 2025 20:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=; b=NmdosR2wzeX82hjX
 R7xfQNChr9s2zZRwEvXdMAMePnYf+JdmCSvMKpmtM5pHAPB4WbzC6UqF0byemHgR
 na4kT9knRJBd7KBRH+oezlf+aLo2y57Zunnb1BalfmDQyzkc7FYiIQcxwUbep/gP
 Wk1B9DC2Lp2f2elSVqOc+XwWzF/D3Nn1U8hCQkxXEIPOHQGt3ht9PMPbdUXq3S2c
 A181Ik3scTCZwoGH8aDUvACinXDjr6UcxqJZp395tB9PG+DG5dBn9DC1LAltrbcK
 eQIaPFbJqQK4v411v6qFvUGzyg30gbwDaTMMPz0H0iLw//4NwUUV5nI1jiSfI5gt
 aKUpSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynwemt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 May 2025 20:48:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f5466289bdso6252196d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 12 May 2025 13:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747082893; x=1747687693;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kMEGDGWDes2oQel40VYHijcONjInO+gIQOaXNYTja7g=;
 b=S/db6DgGjgfjwK96YzGV+oYigOCeEQu1DVTecA+ONTQcBiD7/e1M/jAssrBK2xlKQ0
 YiF955xkoKJ9gNdLDCYy/1Rv4lixODKsNBfYWxpUEDa287/Db93qUegKxPdekw65d/4I
 BwF+41EyAWXw1AkKv8eAzbQwS43DFY7kJ3HjS7u2uvYjtujyfBZiHoBg2F+odA3UEr3O
 YR/jjKowWfuPwFxGz4IpcOFFPY0d8Nk86oY8lpcL4il6gLpoF7I8pYUTzH3bkoxNq+fY
 +rfEsNII3EeW0J9PnmPoGJbAGMzDkT73W31i9LrKMGADY7VHEtfn/XfuMY8ApIKg6vrK
 j8RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTaSuwxXMzA3jwvmoZ/1zZSsZyJniETkhKUDMAYhWVpqDFsjF83xPEyjpkbokVxDt9KmH5m5rdyzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7TJBOW/nw5iE3FHidW+dwbY6DsNGplI9EFPlrWHUUFGF6zMPA
 F8FNdcBIPP66SNyeRe1jkLxLsU5Gbr2vxOb8+aPGYCOfuszovoqBIV98Fuu6rnqrl4qH4B55ofl
 8sTUrq4iiNUEsfRb39VMWsBrd6qwE7UrDOyL+qBsOplaZ72Rn1ofZHeHK9QBEU5nCUTo=
X-Gm-Gg: ASbGncuD7RVghaYlYDOr5gJIdrb17cpwm5CFEQ30XNWvnrU77TinfPeSdMytiBwF5P9
 xc59TJ3UE8G2iY72UUhRPl2yVDoE2uA7kEyyKBWV6Kcpv/qJnd0XYUycmNdM+ZrBfhEZbILDD3P
 +oe0sZ4BOdD1azIrgQVjMWUrRLSpxUJ/ZhOb9/hN/JXk53zc6kovv3iTfbfoz0WM6TqKzJQvRIh
 y995Jd7kErkJp+7x2NWfcjrOQ1dw3KtYLi7RnH+XJTrhlp6svu/3NnFVLgYfm+K49vJsxgHYA7U
 F3e6i95ZvxcA6XYQOgX9iZsCa47vNdy2inl7IWlsbtV+D5tbuI5jWbXGKtO+TZCDjn4=
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id
 af79cd13be357-7cd01044e2amr926154885a.0.1747082892957; 
 Mon, 12 May 2025 13:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1PFEnie7QK9hvQDnRlsXVbaR2Eq3M0V2Jui8DCrhPHVSNfmueMAmpx3G3g/iNJeK6Yme+lA==
X-Received: by 2002:a05:620a:2723:b0:7ca:d38c:5d8b with SMTP id
 af79cd13be357-7cd01044e2amr926151285a.0.1747082892344; 
 Mon, 12 May 2025 13:48:12 -0700 (PDT)
Received: from [192.168.65.222] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23eafca8bsm428846266b.87.2025.05.12.13.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 13:48:11 -0700 (PDT)
Message-ID: <24173d3b-272d-4cfd-8519-ad5c9cf7c555@oss.qualcomm.com>
Date: Mon, 12 May 2025 22:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250509-a623-gpu-support-v4-0-d4da14600501@quicinc.com>
 <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-a623-gpu-support-v4-2-d4da14600501@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNCBTYWx0ZWRfX5Xq668aaSPi4
 xze7Tmmgl9OHdDHcCOuTMexIJFgX0c/58Q4SDa/jMjyqtuoIA8zTpDt3La73Bu1Q3GErYt7vgOW
 SnuS0Km1a2IcnC9snywKVuTzm6Y/gtUZQcfj1Kt/hkuNOcFMCFPBh5XjG7d1L9nL5J/jgNQ17MT
 tiIxbt+K16vK3ZNb9Wk35usAXKyNcbuWv4/QjQgJk4ZFBPny9Vd6bLls4346pjZAin1RYyPflQN
 rkbYA0desqtd58HfwUsob+tpW3K8hxUeC7CChBkWEol0qAGC6pii8bQVg1sT+YgyGjMO5fIL4X8
 EWeAQBu3Fnx+Nqd/zReccSaaGFyCejAsjd8KNdJyoodWIcw4uX9yq1cKYZzHA7kVo7WdGZUfhr9
 MBncOA1AfOx6hJ6YRywvpW3qDwe19fWmLWRAr/EgHjz0ORy2VffTUiYpkFULjXDpU46k68P5
X-Proofpoint-ORIG-GUID: 0y8_PDshht1eR8kMH1BKjPHdgsYcerWP
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=68225e8e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=NWoSzSQ9CBVd_tIZLS8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0y8_PDshht1eR8kMH1BKjPHdgsYcerWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120214
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

On 5/9/25 9:21 AM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs8300 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---


>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 40771b062e8d7010dd93d7cc7b3db73cfa16bfdb..1dbccb9a0c75366aa6986b6adb4feb6164ee8845 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -2660,6 +2660,97 @@ serdes0: phy@8909000 {
>  			status = "disabled";
>  		};
>  
> +		gpu: gpu@3d00000 {
> +			compatible = "qcom,adreno-623.0", "qcom,adreno";
> +			reg = <0x0 0x03d00000 0x0 0x40000>,

I haven't noticed it up until now.. this should be moved up in the file
to sort the nodes by unit address (the serdes node above is 0x089.., gpu
is 0x03d..)

Otherwise, please check if there are freq fuses on this platform, if not,
feel free to add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
