Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAED3A5F0
	for <lists+freedreno@lfdr.de>; Mon, 19 Jan 2026 11:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07FB10E320;
	Mon, 19 Jan 2026 10:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3cgXdv/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS8qU83V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC29110E3F3
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60JAJhkG1531240
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=; b=V3cgXdv/gjAVePZT
 K3E+NRTpWxfO7L5pR505zdQH3NDbceX9EcIOVF7mfXTSujl3y5pTxW3uclrMsQTc
 +gmcLYH1hVhpqEXHeEoSr/5U9CXhR8AdWfdtdhxejh58A/lq+qY/zUOQaVtL8GBh
 Ky4HULGWThz5dbB5WByAOA5HD1SraoixkCixVXc7yFtcxOxfRNiVwHOmSRJU8FNb
 b7hzfVSChf7etGWSquNtNifOoXhABwpSRmKzChDeZJKgf2XNRMpuVJqRFqwZj2Lw
 oHTgMIgNi9AOOem/hRoJ8Btx4FqckSNAawrdeSoi8okKTxi6n4fGWSBDySRhdUCy
 sx9c0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjrxr3fu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 10:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52de12a65so115322485a.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jan 2026 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768820176; x=1769424976;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
 b=VS8qU83VLzWv3M3x0N5Cm+T90PIJQXzyYZM0wm1qoxrW7MWW2AkfnWgesByPb9GkAw
 vn6D5FZPWcrwILEwPOHxvWeHRmsA4WtDMXgEVAzSgHhHTWPR8RgNjDZGGzGspi9xb4qk
 jCHtW4c5xL/XuFhAV5KnGRhe8FputhmZhbO+c11s1hRMxMhsZ8Evs1/O17FzIrDmljHj
 7xn36VFotqHG8+6LuRF3GYTT2UqZrFzfVsVDz81/GtBWqJseeTQbdEppCtZNO4hk1lpL
 zd0VW6/lv5N46UoYEbGteV0nd+xdJKgTAeLEvOYR2QmGJ4Un9rEDNhh4+zqsaCnI+pNK
 Py8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768820176; x=1769424976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vW6ARu7Rpz28zgYCVRFbLifVastvOSHaCxOQC4p7PM0=;
 b=sk+4Sd+YI7Uc3Dy46sriR9X05FnZAiiE5D3UIzjYPeOruqGzjHNN6BuAmTn/xEOnNr
 lHnF81sOannfWZsCccVGplHvjZ6OXR3Unk2YkSBjUJ3iixfwavnMo/y5APsQEcGAwmMH
 qgTPuY30WUEGa487mKuxzBgGQRFVZmIBQbTcflMMyH1RBu3vsdOftFRGv1XzVKF87FUi
 N5d7B6p8layZJY++f6WLORdXrhxvL89WP/laXkZM8UgfqtdeGuD0mu9KtXDbRzaryUMY
 CGIxAnQUY+eggD3ky/XgdznQpzVR17577z6YkwWrFInkqSYSEvnd//KgGNwvQsTBJXlt
 +ItA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdVxHD0edceitd759a/gG9Gt5AaioIawSFZn7kkvsreQAYtdOEpFk11XeN5vo+07w1e1lSUXyMVYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCQUQz8IPtXFVdGARAHhG6YW+OdCBdm/AiLdJ84z9pue70FZB8
 B/PivgUV62UPfHrZMDxBuBy/6FgMvtfNRnanO4voxZmAksph51XT/6HkAn6+eLwLjGSKhG2QukJ
 CF5c10omeSj8WakPbfwPKpZTSWZRIsfYWrsnPVdh8SlfosPqd2Qs+3Bh5mRXTjArnRvGqQdQ=
X-Gm-Gg: AY/fxX7akhcJudDq8QJlYrhnF6jcginiPSuOBvg/zUHmthoeJ/2DMF9DCx6mPvAnmdV
 NGI3oAy/TcKFMuF42+JQ3bZ2m8kyDrdrZRwf9MjwtZKaVb7Zt20py6H3vme4pYj/34rfshiSXKE
 yCUz2xSzHT6E+i46iCzEHZzxokg1SqGRpAQKBlfU4UPuh8V3RgtkCkeufAVYIWJx+1A4pARTAbV
 DdpZbNhuBJ8LPchJT+l9Mt4DyHI7vZjcAJV9jrjWaHp4a8NcBRezkm2d8Xo6WQfCnIYDb9bcbT6
 HsAuBVo9HMj99vax+KzEKQqJjOweQXeQR7NbalwrEUohSmuzDP9+z4bAuoiXv/1yQEaOVx1NRQc
 YIrwZNbt/ctKAlZL+ehGXpgi468dLmwSbjbmqxOyRnU5ogUSlqABaH+bB6H338LtznTc=
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6a67c6110mr1142865185a.10.1768820176135; 
 Mon, 19 Jan 2026 02:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:4084:b0:8b2:e704:55fe with SMTP id
 af79cd13be357-8c6a67c6110mr1142863185a.10.1768820175610; 
 Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8795a18c3fsm1061152466b.58.2026.01.19.02.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 02:56:15 -0800 (PST)
Message-ID: <999ad755-91fd-4ba8-a3f8-1cb1673e714e@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/msm/dpu: offset HBB values written to DPU by
 -13
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-2-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MCBTYWx0ZWRfX00KPDm7yv4ei
 /HS1tMgLrJbpAV8xCdjQqX9YMKYtHV816m7OFETjaGDzrRPrJh2y9cMU9nmRnoU1FOBLWiIxKjW
 z4LvG2d2QYzS8+wcY5Yt7LXXtxwjkTyzPue6VXr/dPPrFqDwUx0stUmemo6P5MnH/LVEnDbl5OJ
 bZrevFD6NpFxChjwgWdoFuV0cj8bxiQgM2ZUJRClQdciWF8aqeRgamKP2CNSPr3khU0bJggzfgm
 4Zzm0PyqKuomt0qFGLe9jlEBdfrWySmbj9dXvhaEbwsx7QHbb7jV3WapnUekZPmMicsOKjPsFn8
 KqqSTwT7tmmzsRf2PyGXK0DwzvCPXAG9fopbN/+MsvFeqywtUvWYkQjDRX0UthKEyRhB1Q59DaH
 5F/Zb4QWlPzIuW8rtIpg3LoFbBFjeoQOZnpQhve1/SgSDDnTHvEbeFZ8a79U8sL/ALYa7J5LhVm
 Pt66Hy3T4s7fMPy5i3Q==
X-Proofpoint-GUID: nzH1wo6jMbf0VEcVaHRLIZ-7_1pt9vBN
X-Authority-Analysis: v=2.4 cv=PPUCOPqC c=1 sm=1 tr=0 ts=696e0dd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FnLLt5dnLMIZ3HHg8ZoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nzH1wo6jMbf0VEcVaHRLIZ-7_1pt9vBN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190090
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

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> As in all other places, the Highest Bank Bit value should be programmed
> into the hardware with the offset of -13.  Correct the value written
> into the register to prevent unpredictable results.
> 
> Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

