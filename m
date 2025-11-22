Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F6C7D173
	for <lists+freedreno@lfdr.de>; Sat, 22 Nov 2025 14:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3345C10E093;
	Sat, 22 Nov 2025 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="huLfRaLt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGbwuo0s";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FD10E02F
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:15 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMChcaM2700318
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=; b=huLfRaLtCRg3wG5i
 9Jz6fXdrwLCSsGeNh/djN062Os8Cw117+qSRGjvkb2tmDKPbuwMDABxuBqUCwGY1
 MWYh68Z0tHsspNbr9d0Is5h3G3EzIBDg+d3O2KolmRv+JlASsmrL3uf16xzK5w9p
 ok28lGtmSCNMbYpcRDnTYJtR9OOwM8zX+ocJ18isrNg7NDVL/ZP26uTiObQHDHMZ
 2AwSWUqQPYwOfK0I56OoQoPIbhdiPMA03vzBVmkeIV7Tk1h/ZfbwrjKdkFW+XqNr
 l2p029gfDWlKkz0TRzhAifTMtC2Ac8x6mnHm5D8tkvmWDCni8qYVEsL/Aou7UJnZ
 I6Gw/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdrpr5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8823e9c63c6so8858536d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763817974; x=1764422774;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
 b=aGbwuo0s6/NsIckNh2UlZYP/8FViNDbJvU+UIOkulD4fJf1F6rpSrlJJYHZLTk3pAG
 s/LCNqFRs8YFdffZLLiRD5zRU4f0IlVp/TXhyX3xpojTrZkNNb9AGZIikU8olthwRwl4
 D7CwV0zmtNBT2u4mH5CxyBisWhztMnOHF9HTzshh8j+UHdVKPAWXvLN5anEA0b63KuHa
 Kw86+qo10sFKODTQJBFmceJNLNAhTjUlTkzKhfW5ex6XD3lzl8AeZwsh2Oy/stT2YNW3
 MfkwkXAwb1WcRFrg5GpXSVouiU/Qqldu6Zymc2WUi729IxuiQMI6Vom+Nsxk05tKu9WT
 FCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763817974; x=1764422774;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p816i1l2ZUk+XpL8HTMV728bxJNiG/n+hICNaw4PPk4=;
 b=PTXmH3unUx9dwEWUXRFWjl5zr2KK66Lcw3y30TtEZAZ8Tz1WYV0b+It9ldOgw++CUl
 7ZZjb9NVgvWgxiv54QLrY8dNB8CkG8CF7rLr2AkMb1h7/efjQGvmgDpSiuhp4woeufZA
 nLj1kzmQxO5vAS3AsCrQ9wb+AZ3CzYhLi5rr7CsgnP22oKEvDdHUM89C8zVS2zF8e5Ni
 OeJM3jlZFDnOimqH42FgolWjrsj7c93nu47FWh2CVe/4rXZQ8LEPIRzoY1EwXOCpkicI
 dxQemgmU3s/ehoE0c5qVJ5GzSezx4Sbul+ykRuqNhcp22FuOZcOpV8tZpXlkl+3+AXYo
 FYCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ8mBDEdNFF8l0Zroo7z6qGzNl0JI7KTZnLhDSGf4yb3WX6NsrqTcP43KZxY2mf1LCJWbEAcVtfnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEpeB0/k+vmqyS9N+Y704Y7SDWTvzwzjtMm+ranrHWJ4f4uRzL
 +3gv6bfenfNdn6QRWd02Qp/HN33OaD2/Whv0/67dZzrGPtxQztmddRLqipOJb99HdxxeBLynQ3B
 8FpqwXfDZ7lbRv+AUWQauZ3W9ZKqQWnrk7lQ+3BkifFoOLiL3F6dw2pbZpxzJnOOQoaanJsQ=
X-Gm-Gg: ASbGncufK8MWQQnL8r/4upsw6+H8vmgoVrxR6rP83VNk6dGoPJL/DQvgSMsdUuwFhz2
 H8aHQLFVmwfa378WZQ+fUUWClphGZOPfFupwrQTo+s0JKPJ+KXRORGf6CktrVYwDSkR0JZhSwl0
 wGnkUZNpd7YWiADYCTLk8Hv65ZNucUllVff9BfEudQ0w1kmEgjFsBe0jimj98lsDnfC+qQr3r35
 sVu6WHr71jkSBPhidELlRLI6ZIC8RAo77qdNvPMgH79i9akq4BcM7KGJFf4+JLLWqVMwmfGv/5s
 mYWZ16irWsjo1qQhe6YH/E6BwNEVgRHsAkCBo1nvE/Dyh/mAdIF8CNqTanHcbH4x0NxnZ1BcIAY
 n5nT8tiz3deyrHDkL+4x9KWSImMRLuSJ04nC81WRp0uGR6+fPAkwOHCHPi9zuZlP0OiA=
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee5b857d6amr46533891cf.11.1763817973731; 
 Sat, 22 Nov 2025 05:26:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBwKWs6nvulDhBOSmKaGQR0LDQ9X8bhB7WLU/5pQciACkOc9xbwVxBLOHfNzYoih13QUt6sA==
X-Received: by 2002:a05:622a:1306:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ee5b857d6amr46533491cf.11.1763817973128; 
 Sat, 22 Nov 2025 05:26:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd43e2sm718730566b.39.2025.11.22.05.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:26:12 -0800 (PST)
Message-ID: <bb816e13-23b1-4a2d-a384-84efaa3fd575@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/a2xx: fix pixel shader start on A225
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-1-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=6921b9f6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=u8D1gFNLbthjCoXLUvsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 3BCeoSd6XJTFcXXSqViB3zDWEL_JtncD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfXzZ1k8CpVGRsS
 GPkvorH5zGySirkxLsIXo4tQ3oYj/EEuuR5L/yX4A23pxUnAW4rECv05I1kq7dzn49z/nDTqm4D
 6hx2dLuk7zYTLvX/JkpAbDILXSIc0KWHMCHT3/G3wpOUQ6bbh3BFWmpqCEwQBaS66sFS1511cqd
 UdYKyg48HSkF/XjPWHwrvnzPQTTGe5jb6W7HjEEYUGLoza/tTXZ8+eQK+3IbYDQ4D5vqkwz96Z7
 NueC8Wr94bhjHjDF+v5fYJg7lYCz15Yxs8ckih90PzgjOyPEk58JQ3H6O+vH26wFJcgjp0iz6FX
 iMYTCRaUr0gPA03RaynmqDnGsBI8TNWq97/pFzWYd4fwnyvsf55RwTECBX/JL7k3lIbFBVd4bEV
 P5fx6mY1LJ2xL9ZTbCtlZwUZpnGTGw==
X-Proofpoint-GUID: 3BCeoSd6XJTFcXXSqViB3zDWEL_JtncD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109
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

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> A225 has a different PixelShader start address, write correct address
> while initializing GPU.
> 
> Fixes: 21af872cd8c6 ("drm/msm/adreno: add a2xx")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
