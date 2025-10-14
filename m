Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE0BD8948
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 11:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A892710E5A5;
	Tue, 14 Oct 2025 09:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNOVm7Nn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF4710E5A4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Jda016191
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=; b=HNOVm7NnkRJjzTul
 4m27bq5RnHkIE3pKfuThw6zYZRcYVwqQJ4GLjTZ2Vp7Km/aUk7yILUKO3HKu9+qI
 u0cfEd2rMsLDqe2JzDWL7AVj9HtcYNfQ2VBGAQXvVckTmyn37lKPPKEfy03646At
 0Mc2Z4WC03US4WqVvLrAUKMLsAG8zZ/5cYEn8t9e/95ZWXFlxhi4v0gKmYUI3sD5
 mVhFvSwg17f3htGliHI27DkfXtPkzQjWL7TO786c3ZfsHkQ0RbazZPMW2o7k6lw8
 XILciNaxVBqsFMNLYQlvfjbMdgxQZR+xsRmAUrB0boAsouwPJUFz+zFGv5swGZC9
 Bo604A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd902f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:53:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8649a8dbff8so226590585a.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 02:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760435579; x=1761040379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0bffc/XzD9MvQE2h6D3BwBGaZfZTTXTRLHrFoBclpY=;
 b=lvAA++zf+Gn5yPWh1o5uJpU6MKssiTQ5OZ1h/ABXQtY8/7w8zEUcCKv0BPjWrWQi+4
 zkPLjc/6wB4YVS9/7+quxajLSNq9aMiIXIzX0vpIG1IlxzfskoYxcgPfW2TAyp60oZII
 9OmUpmibnGZbohsQt1cceJWKXftq2n5noRiKdy0Csh1PT9FpUtAgBru7FHzrCacm4nvA
 J8AAd2a+utjOLMRYpklNMgVdoL+n3DaOcdNrbHOE6+wccISUeEIL+RcBUHdhozFQUKcE
 FxKqUP6MpcdnPGLGj/Lbh0GGa9f5qdZsxq6nGf13ObAoMtZLQJgW9kA1LVfkuvHonGB3
 +Ymw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk7amqj/yXxuXJl2wwmd+4HCnNUZomg8Fh2qhA3E9duICQo+y2OhmWkUdqnjpUyi/mOdnMuSyzFsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYouWkzPmDO2VsekRhLRaJVHCFZoNl9U68Tgy5hWyZ8uzYbRNs
 8JwfMMSYsoejL/Q0sShj07bfjQHh32aehex7DJDs7LOgfI6EM8yANyvDM22uz3OWuTYsU8+0vkf
 Hzh4al7Yp9weTSuwrTGRiXDeIq2j5Dm+hdajovytPQ+uoreyB8dZYZ4fm7l7Wlg5BuSoV7N0=
X-Gm-Gg: ASbGncup452pvEqAfZBixYgA5yyXoiFD/HxESHk1EqaL666LcdeJtO6fhb5ia23Ys1R
 Bv85G+AdJ1SLYvimGxu67trHZjGENKLIIFs6J5+zA3FuotLkzzJo/6Uy8UZJYFhban6NHDdP1FU
 fn/iDkAjlL6CJIvmOV88W5R3a0YfDE25CCn7wuBy895j2U63r+gMAGCE2NMhwahKoKn207S3ikb
 cqJ74tDDudu07W59l+3K5ExBhT9XhBN/hEkiW4DwHCGjy40CW+1z3XE1MeVhm4W1RpXjmp0SE+C
 ZaiYuhL3+FXZmwvlZMKrMxXWzKhStkjRJ3/oaY3oU/V9tG4Sy0v+P8C26HosvberCkfwWJON1bm
 31e0L4s39cH50O4+IST9ptg==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id
 af79cd13be357-88352d9a2c4mr2163600085a.4.1760435578884; 
 Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnUhF01Zofq6EjRpw5993//+lfD9xui8peDVWDyOkLe4ZPEIW0HfK9WyJ8gfgXNrAo6KOw/g==
X-Received: by 2002:a05:620a:7012:b0:862:bd48:923e with SMTP id
 af79cd13be357-88352d9a2c4mr2163596985a.4.1760435578438; 
 Tue, 14 Oct 2025 02:52:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d65ccfe0sm1114443466b.25.2025.10.14.02.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 02:52:57 -0700 (PDT)
Message-ID: <509e9902-2f74-484f-b5ca-e1605a221004@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: xiangxu.yin@oss.qualcomm.com, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8yRxzDMvSHJxuUJmDG_bVgeiWedQN7e0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXww88MXjDS8Dw
 e0QjHOsjUf3MceFlPcUL9/bIpKaMEoiBZJyCIiKDf3KnLYB/o0ZL4rfVqTxFvcbdNKy5uAA/U+/
 9mJSJ+Er+fq6FrUVeYdITTpNlQG3bGlmA3E8zjP2GPS3aAm0/MouFyHdfNWrvkIUHKpUDeBdnyy
 OIaT/HjzLRB9WAmG37TjXqK/qzElmYiDY4CibbQj78wOOuT3xPdtxXe+SaCESQZC+OATH2cawRx
 UIzEho+AVDgr35TLtHBzwxclPdeDZpLYC3ayvlGzkbS0i3Y8PhFIzDJIZaD/eIvMrpk7I0m5NHw
 Z3LFXl3Kt7njpneKGnfho1Xv5K48kx3wPDIurVr5kh9Q4arDEGyem9mOVSrvCRHu5Y5/yuhc0oe
 9aPISsc8M5ulPS10o2NdDzGeW4DSHg==
X-Proofpoint-GUID: 8yRxzDMvSHJxuUJmDG_bVgeiWedQN7e0
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee1d80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-JAsjFMKCY2WfoXnbYkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On 10/14/25 11:42 AM, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> Add DP connector node and configure MDSS DisplayPort controller for
> QCS615 Ride platform. Include lane mapping and PHY supply settings
> to support DP output.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---

subject: "qcom:" -> "qcom: qcs615-ride:"

[...]

> +&mdss_dp0_out {
> +	data-lanes = <3 2 0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;

No 8100?

Konrad
