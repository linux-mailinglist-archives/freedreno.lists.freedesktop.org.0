Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796979F0A1A
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 11:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D8410EFBC;
	Fri, 13 Dec 2024 10:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="awszngcr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3592510EFBB
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAj5as028134
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 irpyIGk/Q0YF6woDF/wcVcUCJnQrVPx3H7tZ92Jopi8=; b=awszngcrShQZzvPi
 n0hEB9bmooPgpZMyxjWdWzE1FdZbWqj0rY+4baPFg33/WXHP3sYkcH1MER0bcb6Z
 GBGQjqtFicTO4Yk9za0JTmJt2w6+krDe2OHTzo5nuRsE5p0Up7e48hfHCCIqzanN
 ONm+ZGMnJOX6QL4cIFPm37VsovtYSR5hKAz+MfvvFwelvo1ibQl0cvbrVbt7HVYK
 SWiU54j9uq/1MS8IVskDjcrdGgbqi0ji2l4eu3VdtD5bCBpA66+SxUMCz5pXgJPT
 Dy4Yt8Jp5w/4gCsdPuiTxiUnxJwrrWXyjNyk7q4FVCFEYnr/JED9weoKVI/ZlaeC
 8P2jqg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fxw4uc5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 10:53:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-467975f1b53so4262461cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 02:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734087206; x=1734692006;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irpyIGk/Q0YF6woDF/wcVcUCJnQrVPx3H7tZ92Jopi8=;
 b=XCD8XleORhgcRXEc7hAs25gCVCD3lxu4JnyAM5YqJFz7Dzj1aADcyKTMimCkZ1UUAc
 vVVay3tSMwI1TcidfW/73wZnwRtX1LTwLPpjopjY7TqBRvAFQm3NXepzIVPKBZg4Vc8+
 lGN983yUMjDWjVmLi+k3wmwodkyslk9cUjk0eao9daQ32Ps+WlyUtI9sx4/5iu/xguVR
 jFQSn2Otc6xHbGri9gYVPcPtv8+75ZLhj87TlFrqOjeBJJdLtSUa2OHiC6gDwU93voVw
 dAs1rO9yI/3sjrtrLnvGhIXaP3hnFQOFfOy2CKbD+lia5cI27x9rwwzU49X0ybTVBE5A
 e5kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS96tposllDLj86qDgDR4hBuWj+x25FMReUNYNTgVCZcubCyGHedHXdJ8ZwdEfG2uPWspOt5E7z30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpCj7PLczxhNgS846eULd+cxwaxg77fIpQhDhzcl+6zYjHvfCG
 LRulRD4sIIRVmpuPBGJmw2XmhfpL5NVT9j6xVr93l7wg9Qw9m2HJukpKeDhd+XSj61mXAxoROnq
 wlD7Cd8UKn5g7Lo6Us2kIsURF1s8w2UINCVsfshdD+yaVEW5hnGTFV1butN1I0uBzhuw=
X-Gm-Gg: ASbGncuN3/BuQb3oMOBF+EZVf9/UdLm77FbkYDYu/AHnEquRnUrJufVu7E0mOz5FQou
 El+tl6JCOGVfnCwYCSRpRl7aiomdjsXrix6Qj62fudn9pGDAWFKGfLcyQZRgVrOjOTY6teWYStX
 IlKnXkbd162eqETpbLUiD8P1g5i1aTPa8cjKe00cdLIjacANIV0yF/hSTOY1uvkLcw1/3U/SMpp
 0a9c378TVPZWanSVb7HOV+D9N01QXdsFCGspMrdMchYpwu1k6WHatZfawHYVmBy6gjaN6UcDBDY
 W4gCozeV1Kyaho07c2dfDlceMBtm9Uk+lpiY
X-Received: by 2002:a05:622a:13d1:b0:467:825e:133b with SMTP id
 d75a77b69052e-467a582600cmr13964411cf.13.1734087206079; 
 Fri, 13 Dec 2024 02:53:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECRFHuS1VOciP42gwRe9QYsYpR8HsKDaOPO2V5MwSaCuCKb67oOndG87qRS6M/GWLhkhClaA==
X-Received: by 2002:a05:622a:13d1:b0:467:825e:133b with SMTP id
 d75a77b69052e-467a582600cmr13964081cf.13.1734087205613; 
 Fri, 13 Dec 2024 02:53:25 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3bf50397csm10148990a12.79.2024.12.13.02.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 02:53:24 -0800 (PST)
Message-ID: <28bf46a5-dedb-4491-b9be-23fdfb99035f@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com,
 20241022-qcs615-clock-driver-v4-3-3d716ad0d987@quicinc.com,
 20240924143958.25-2-quic_rlaggysh@quicinc.com,
 20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com,
 20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com,
 20241122074922.28153-1-quic_qqzhou@quicinc.com
References: <20241213-qcs615-gpu-dt-v2-0-6606c64f03b5@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-2-6606c64f03b5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-2-6606c64f03b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kkbxp_alHWN5Acg-D5TMSOlGMS5LgDvb
X-Proofpoint-GUID: Kkbxp_alHWN5Acg-D5TMSOlGMS5LgDvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130074
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

On 13.12.2024 11:35 AM, Akhil P Oommen wrote:
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC support. Compared to GMU, it
> doesn't manage GPU clock, voltage scaling, bw voting or any other
> functionalities. All it does is detect an idle GPU and toggle the
> GDSC switch. So it doesn't require iommu & opp table.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

The bindings file exists so that people that are not in the know, can
reference it and learn about the hardware. Please spell out IFPC, as
that's a non-obvious, hw-specific  acronym.

Otherwise looks ok

Konrad
