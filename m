Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A53AB1B40
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 19:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4D810E2D8;
	Fri,  9 May 2025 17:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8OpSNk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4542210EAB9
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 17:05:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C2gsn014025
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=; b=fa8OpSNk2ZXlXsKe
 XASyk+9t77O0nPWWfpPX3oIH7QD4tWzx26SShdjm5jDHdirNDGKgzJqmfEr3Isiy
 Vo87v3AxkR2wmD1BbYTEuiktxnDvYUgWXgBRV1PwvKAQPyxHm4hypCLiVYqkHJb6
 fQnt/jEAwyp4+RFheRMt1ILP/TMGXv3MADpwe+pPYtmMpmBHc0pzNmu4S7FkZeiY
 vv971hbuON/33iCIixZ4nFFrfomtPm8nHtfYdP+hftVFWELlHR4d9H2knvSCF3zb
 akgC3CkRgqn49bAEh2RRmujymXT3k1iHaDrLR6eMyOCBxFCSxL1WaG9JFGMjrXP6
 fy61Mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4ncg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 17:05:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso56783085a.2
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746810353; x=1747415153;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=;
 b=YU6T3FUF9DH+CH2KUGMSISTP5quMoT8EKNiqrEnh3rGejzqyg5IgYbi6rEvt+EX+WC
 kSd9ndzY+iO6AHvFxHscTi1wbzwUzljYmn4Fu4tr8IlpKlSV0VWMtATmFpE8EyWwCE47
 zygEMvd1FKTzQsLLXG+Lm2M1xkenc2FkXNaoXQnTyraxvNLLH4ET4nhAtK9LS1dzufC9
 XanduBhV3btjrRu6Ldqar9DjRDa/t7UrKUL54LdckneXVq9NDkQQg4JfEkFCJS8MUzXN
 afGIDKMwOG9uEg9Xt90M0YAXvOjW7YkIps7IfqaT+vVm8S9/9ezx7UtssHPw0EqQFEvt
 FnBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSbY2LgNlUftM7XLd5yztJni0tRve8/4CjHZl26QD6N+2DF1hf4+ezDShCnZomPx1uI3DVF75GkW4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx36JNWD9aSviHxD6orQP/chGuFY9Tn7OJgs/zIuhLdhYmZojmh
 kEsasnAeq8LcIToMT4KUQK6pTsYwFapY4+7FTLasXO6jPopurBB3G2SYtXVGgXGF38Ie+68lwJd
 d1eeLrlxw2ICRLx797cu26y7qY3MdkVhOmcHEczrls2+DQD4RD/H8unwEtQieZFvnzuc=
X-Gm-Gg: ASbGncuQg7cQFt3w+CuGGvQvgXjp6p+QzIAX7/1lZz+5t+sTtpLkv4BNnWIyIRpgLsI
 jKTrsYMlpV13ZD8MzZ/gjTtXgr07xXngMFS8TK+fT/5JVx6SA1BXA7WmrKQUOdeEc/CjkvhGQVc
 AI9MTVxLHF4Rbd4Hff8HeoLoALJQsBHICncAzEqzDa4pK+IGkvthIdL9kqZzDm3Wm7pJHeuHQeY
 VcW/e1SAfqYiA4oJjpkkACJPKMAcM4HbU7Ug0YOezkVW35/IbQCM61gPov/Rnvftb3oGvEUZOPw
 1ZaniXW8CFcaDS1F00P0XoWDzPGXw+0HPG4YkNrVymEd9mDvTn6E+0ZkfWqp0DqA5RI=
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7cd01138c43mr237839285a.0.1746810352547; 
 Fri, 09 May 2025 10:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbRp4cqQeIx22c94yzN7HcBSLTFgM40PIl1UVIm+gxSUeSDFOZOAzyxFmgxbh2fxCrwm5SDQ==
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7cd01138c43mr237836785a.0.1746810351945; 
 Fri, 09 May 2025 10:05:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8ac2sm176736566b.27.2025.05.09.10.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 10:05:50 -0700 (PDT)
Message-ID: <249fa3ea-4b0d-475d-8851-5a31795f3b11@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
 <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W1O7rpI5qGhyZLVU23_FXKtKWxUx9X5t
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681e35f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qaMJGrL2tkxVvb42h3kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OSBTYWx0ZWRfX+x6i+GNEVw3U
 t7N0s45ppPUq5Td7eG6ZFOr6y6RqLP8vjHsf4uUKmOO4UpN+8i1AtpWb9mWIGTPPzkQZ/bi22U0
 w+Av7JcVLAYtsamaMsNo46UGYz5D4EoVWJRFLAt1WRkrXqPP3ruKkOx5ADEzjVnTAhBkr1DMg94
 yxUF3XENyCFFvI8pUozMKSTQuGmVSNrz5ccPdYeBdDBpBMk5Z6491sdtru1K3DoVUER0q+0OrIj
 DrAG4pXvhFJdlZJC/8ZEi/oTZuzWnFi9f/+upwek9u6pBoc5s+DXPdG4aQf6xtOlJCy+mk+ViWw
 EGu1IcAfJdjG1W4d912pO1KLtqEQziKWovNpUBIBLYQfU4yldysvLD9IlA12HdvBsjYzbFP32Et
 iySvlOmoOUMEtbpWID8TQZTdOj6q/0J3s5T4ofNskHfq3QjgUm9fKxSNcM6EAMR2yxvighPq
X-Proofpoint-ORIG-GUID: W1O7rpI5qGhyZLVU23_FXKtKWxUx9X5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=993
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090169
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

On 5/3/25 9:03 AM, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
