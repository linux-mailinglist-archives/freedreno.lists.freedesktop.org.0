Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970DA9BB26
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 01:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3A710E206;
	Thu, 24 Apr 2025 23:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EHBw/Hy8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1BD10E206
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 23:18:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJnAXu026177
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 23:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7og1m4QXbWK/nr2OF09AhB25ZLfsGGyD/FX+eHZ2Dec=; b=EHBw/Hy8LV8w3G+a
 4UFuBEvJB24zprY0jJ1TzRew0KQOB37s+G2wg/CLXv5jP+cpVwqzWcmeoYDkYLzI
 VbtAUEs8xWGmq0oOGzHYuFMEi4rOutqRi3EIcPrnLKJObR2/NpMw73SS6i/Dww1F
 2/Jc7ZRedb4kryPcXlUToU8LFSrZcCnrTty4qh4g7wr74XOXN61ZYxIED2hbIpoE
 daalIGvKKltwBdcDC9MIQuMOig0/f6m9xlvtts00u4M2GXGRd/WOJ5yYQG5ZFxoD
 12WIPvOHG+LGtTJ8C8+mTZlUv7SKLq7B8mPHdeQes7LP53avFxVZ8Nv57AuI9f5R
 0/baYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh171rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 23:18:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5ad42d6bcso36418785a.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 16:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745536682; x=1746141482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7og1m4QXbWK/nr2OF09AhB25ZLfsGGyD/FX+eHZ2Dec=;
 b=DZCBDqIA9sXlFAVVBnvFjvJvFBBJxuBUhLtyKrDK3mUEdk2yW+UZaGlBfkV2DbJ3+5
 Mfa7eUK0wUDTaXh4jbamHmJ/RxoIwYvHNzDJX/KHg7jrhN6nf8FvxB+qKTHE+KIiMkYW
 FukyQ4ByoU1WZxZe3p66vQnGAcLZ10DRcxrM3OTdyIpN52fbrcYbxmSoGulN3BBB+pPS
 JnNyo6/zLz/wDfypT2sf/NyGVSzY3ChP9j7x8BgxuHmfi+fdFuF3nLqOXM67iDbayEAI
 s7D2kOUn2v3J3wPvNahSgwHtD0qKU5qge8Rt7kckDyuf+kTOsL/0G9VaQ+vfvD76XMET
 lGzA==
X-Gm-Message-State: AOJu0Yz8BUzTH2KiGEziG1xdmA6zdGWAZJlChyZhYnka8G7nAE8RFTZE
 1cvqjo/cqEYI12S1D5zLFjcUmPeWNZmU34X8SmndEbBfDx4brwfrB8Vrk/nGFxyTaHwJXwUXug0
 n3eRNQUoQ2+fMx8TI9Bd5xfpxUharnQFO6kTr7UAWnq42aVnf5QdcPaZoYrR/vitYI80=
X-Gm-Gg: ASbGncuAS7LokvjUqULuErz4xtEA0NutHhap3Tt4tIgJJE6ujDq1KLrBTPDC9ZcGjyK
 9L03xY1Pt/Otl9laMSF4to2l1ynJ7slawGA1OkfBJer/gDKtckrK1LL8Z1XbLEg8agx7nPQ9wUn
 nAeV/W5QqgCnPA6CBi8qh+/+Vzc2hIG8iItyuHKeEk/m0K4spOMmoo2Q0iEQ3I4s8eRmGDaDhR8
 dX4t/kEMoleOU2TYKS4bRJI+MFqDbbUxpOxEXyeYv8AiimFiBYhJa1mznOmFP2CznX61oBM9VyL
 8YjcmkMK4lG16NyncMFw1wgencEEk6CZ/VmOCnqg6doGF3+bkIp2rSR8tlnrGLc/mns=
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7c96054ba7cmr25743285a.0.1745536682617; 
 Thu, 24 Apr 2025 16:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPik5/r35mL+EIcGbf+RM2MoOv2jnncgA6qdCVhFUvXosFl0NrbfDHC+CHKhs8N8Lpc9aSqQ==
X-Received: by 2002:a05:620a:319e:b0:7c0:9dc9:754b with SMTP id
 af79cd13be357-7c96054ba7cmr25741085a.0.1745536682180; 
 Thu, 24 Apr 2025 16:18:02 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e69d9sm36297666b.50.2025.04.24.16.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 16:18:01 -0700 (PDT)
Message-ID: <91a22d94-6460-4a67-8ea5-a59590ab2ae9@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 01:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Be more robust when HFI response times out
To: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org
References: <20250424-msm-hfi-resp-fix-v2-1-3ce6adc86ebb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-msm-hfi-resp-fix-v2-1-3ce6adc86ebb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: il7xAw6Q70g1VkBbm0HOwtRdRY7Hlmt6
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680ac6ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=QD53dG0uoSx0UcML89IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: il7xAw6Q70g1VkBbm0HOwtRdRY7Hlmt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NSBTYWx0ZWRfX5mRvJC6BxlNU
 24RkqOha93hvyOE57OvP3OpVuAOZpH2/5S2w5t8AmXWIeTXV/Zqf70xqJb7e2FXYt79YGT8M47c
 t8QCz1PnUgHD6Oafg9Zb5vIdGcojUZ1RNOcVjoSgRQiJY1FK755TqzgpsB6J+i+gXW6gwCm+K59
 8s9R5MJwPHF85m8KHlXikE9el/HrYg58UtwdQKWJIYKbfDXe/ikTaKbpRX8einRD9I2/rq1nLNO
 C79LePAn9WdYc56A3jI2wR/HO/tcc3d616tYRU0hjwZpgbsGXX7lX9ATtXi/SqAiyPo1thqNhW9
 5qHM8vVPZy22XFJEPsEI9PHDaS5oIL7TqBXgFkSLzwSUcVxqctpIixZK4bwqSIH3DtJw0WL0R/U
 QNxKEK0VGlwXyuNz33JnsGlcZQHQ5sfPsOtZq5DfGvEj6JMG0IrQ18n/fXo1CJIhSeKJeWzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=534 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240165
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

On 4/24/25 3:30 PM, Connor Abbott wrote:
> If the GMU takes too long to respond to an HFI message, we may return
> early. If the GMU does eventually respond, and then we send a second
> message, we will see the response for the first, throw another error,
> and keep going. But we don't currently wait for the interrupt from the
> GMU again, so if the second response isn't there immediately we may
> prematurely return. This can cause a continuous cycle of missed HFI
> messages, and for reasons I don't quite understand the GMU does not shut
> down properly when this happens.
> 
> Fix this by waiting for the GMU interrupt when we see an empty queue. If
> the GMU never responds then the queue really is empty and we quit. We
> can't wait for the interrupt when we see a wrong response seqnum because
> the GMU might have already queued both responses by the time we clear
> the interrupt the first time so we do need to check the queue before
> waiting on the interrupt again.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
> Changes in v2:
> - Add back error print about the queue being empty if we timeout while
>   waiting for a message when the queue is empty.
> - Link to v1: https://lore.kernel.org/r/20250422-msm-hfi-resp-fix-v1-1-b0ba02b93b91@gmail.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
