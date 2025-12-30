Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B500CCE9E20
	for <lists+freedreno@lfdr.de>; Tue, 30 Dec 2025 15:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFD910E012;
	Tue, 30 Dec 2025 14:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwJA9dak";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvxFO28P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA34710E012
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BU5SV6D901151
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=; b=iwJA9dak67b781Lk
 4NaV0iAKDY+b2kL3XbgtYcdlKRT3B4v+pRkqBkQTUKsgZOt95/zcOqhoEDz/njHH
 N5CerzgtUhfXLSJVhCGpW1RbRiNIWrA8eaCtipOTM0cilxL3A7CHwyOj1GAcvK31
 Q2PHcpr+KAT2vMBV/rog3g7uBxc1JXQmFOdYviBkBNEMa812aGPB3eT0+4WF+GzA
 BVYzARc82+zrOCTkD72ta+gdviEB5xGywJxwWMDwhcKr1qRWk0cJA1j2BNYCVExD
 8Y3Bgk/4Fq24XKd+E/2k4dpzDTq7lIUEgvZVJ18x6jmHtt/lgjIOluqADMrA+cQI
 qlaeXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky15a7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 14:12:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edaa289e0dso33643891cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Dec 2025 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767103921; x=1767708721;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
 b=SvxFO28Pvawi0Au8t8Rqz8+dZTHInXUOHoADcnV1/TSjcyY5sAFVtsWpYBSdvCiJuF
 +htBCH82pXpjs2PgRUNbknCEAs3nYQ3LwpSQVPXmPsU1265ZddBPFDjITDXh/jnZnmNe
 ponzzF/xNzCiI1DB9MLX1Iq3GqQTZGo6XLLFCjCoCeJnLXN4gaAMVKuLKNFSAZaI6EBP
 qoj50BhJEqkBkzD/nOjaUtdeY5ko7ke37SzRcpnDeLeejd0G2d6lOfkYrfasax79b/uc
 xpiHEi2rWzrZX659k9St1I5RktQXD9Xfb4ZHhA1JooLTR81zJix7aq2CWUpTxSadAOW4
 hTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767103921; x=1767708721;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HS3TEANSKSMWymmtWV5vqUIqqjugX/Y6BQA4UQUE6pE=;
 b=o/hUTi+QL0t4NolNG5xij4TaYH7JoM13zljswMMhqAiD5yzN709eDjaQ568YFxB3lz
 D8lSJMGtbELqev6NyXktaUhsh4Gtm0NR1sE96/tSIfPD78y5p0ofQyU3Z65NZir0ITEP
 OHcE1AEAzUjRSmM/qPF6lZLn1P5E7T517uC2jQASIQj0YyI6K8u9htmwJGlprxbYuSNg
 ScclWlqWjw8ZD+yn9Q+Bb9JEt7MvFHAKt1r+AyV58hXqEPG30fNV1CeO5nU8XTWbv3PO
 cP4TbbFh1dcvE1KiRWtdI7nHIsU4MGkbCRxCWIIlOdiRw13qz7OmAAtkEF6a4NicO1S4
 msJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp1rmzIRjravHNj9a42d8shuzdtCop/lc3RU5LHiR2lPniw13OKTbNL4RDXTj5UjEfJ03HCAozdeI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Cr93cI1ToBEtyJEZ2dz3GPy40cUCbPFCytjhjS2Bbv7BaXF+
 vtfd1u5bJXyCwxMTD3SyneIOb6n0skjZ1u+S6VEQimS/uV4yu1ZJEvVw9Ng8Iy7ghbVi4xxXIni
 RDVD3DvYi1o74jPtcu38kfyA8ZNJ0zmy7y+++nYk3muL4+mbtOEXYcaTP9FrkjiQ/dgC8C3w=
X-Gm-Gg: AY/fxX7FksKDEcLqmnVMv91trfsqfmrUrIaB5a8yMGM/mZtxVMZj6gfxFWC8ZDTrzMe
 TkJSZ5yPtbY2EKewhuJBnZwtv9ZyXW5xaSklD57zZDL5+3nBfMWknMjaEFdKvVi3oguVF3wgRn8
 yDfyMWZLSJvnbaegVl71FdfqcwGaCoD414WUE/n439GiOAXlLR1K9IKY9o0wxKitMRe2PgBnYIr
 vtzHC7yJHpgVgT53bRcnE9kNvhpuEVun9ZqG1Oq05RXEG8l1N2AYSnkry0+9L+7GBFmEuSowOPk
 EIMIQrR2y0tXuhG5Sf+cdcCAkDXJ8hpnLP5ZF/c2A5nLmUMt6xfrMQ4JkPgzzl5krB0rpOrZfwP
 XPs7CuRQ8MAJZUix2+32tBwAwjhtr9pSUzPezdPRatJStBd1AfmumO+TzCdMZy4hR/Q==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4f4abda5f11mr392930441cf.7.1767103920933; 
 Tue, 30 Dec 2025 06:12:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjQZFxa4VrpeId28bY9g+GLwW9YjHI5WOe3r+GpOiw5AGB2EQDoUopk5HC/dXCkr4ncHO0Ew==
X-Received: by 2002:ac8:5748:0:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4f4abda5f11mr392929851cf.7.1767103920380; 
 Tue, 30 Dec 2025 06:12:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b830b5fe8cfsm2133862566b.59.2025.12.30.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 06:11:59 -0800 (PST)
Message-ID: <b486af10-bc66-441b-ac3f-ec150caf49ca@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
 <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-3-186722e25387@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX2T+hAPOWHQSj
 1+ooxhXaUvhZo2XwDjdosH6yPDf6+OUqKKBAaV7jzBWRPI9znCCtrdmfhQLZrQiTldR9XeSdCEs
 uayJqZ6YzaVOLEEpx9WRY30JvNIavtWCM20lHOVx863tsvIb3IW58dRw40aw1N/8MlvlTEAiUSP
 EP31p7QQa2ISNWU8ruQ5ZY54ryMA9Jxa2daER2/IoZ2aNcFKw9Lp8yvmkQFQ3803jCZzOtmI/SZ
 7/YgEBK93u+Gna1W6GeUC4XIM1pWgNB6TLhkSlgXBVBcS/B85W64GsG+iQDlZFFF7CnVsQvijgA
 e5z4woUUkJICJLkbqxs+phsrE7+YQ61pUy5TFACXxIddkvy+pGayQ7SKAt9M9yIKWEcYi10/9tG
 deOp1M6NyIp+GP/KopcaFxtD0yDT4Di0Y0yG7nQH0P4orPQPeSsmWKwkNiCMCC+Zdroo0RvcKY+
 cTcsoXejKFkUga9CYiA==
X-Proofpoint-ORIG-GUID: 57t0Ro9z-xfLJ7TR7zmOuFGxEAos3hbE
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953ddb2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3cl7Maa516Pf-TGxC9oA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 57t0Ro9z-xfLJ7TR7zmOuFGxEAos3hbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128
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

On 12/30/25 1:33 PM, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
