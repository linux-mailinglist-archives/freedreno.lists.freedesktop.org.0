Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC74C0E180
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730A210E4A1;
	Mon, 27 Oct 2025 13:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMgqTSsl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ED310E494
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R7JtXv2059245
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=; b=AMgqTSslhd3ndFOt
 dqaVTSoL9I0Zfjiaw8wgPnHdQHVb0/F5h87o/XiWWAoBiDz+LQfBn4koPhk41kVg
 nmXaJIjUB9k1d+TxZn4KW5VaLDHR1BAWdz6AmQbj6O33EFRrOjHwePLeznR/va0Q
 iVL063UKzUq1hnh86qwdKmwsbe33i7CqOp3la95J3+H57hCZkeAUQGINL7l8A9uH
 Sa2/U9m96B0ooVBVl0sbMowjZBT3TD+kJkuqtjWgiKjUv6ZVmHHaT53aeWKo2EZ7
 PJP1OSpcP9nalsnDkDpaTZtIqC1wnaBeheHY/UAWuy7gIBG/Rf0DkVu3yvGm6SAV
 tyP1yg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p91x4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:38:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87c1d388a94so14047746d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761572300; x=1762177100;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nlqNAIoTMPpjwqW+Bc96s3wX/9oSlIUuj/zs6ZRUaZI=;
 b=snaIjrRofYxBx0SjvtIrAE7xlXCKNAL6CEkA1d2juzwFcL5VrlF1dlFWsjt/Gan5Nv
 GAO5l9dv5tky1hFCoIj2tuPtrAbYdNuELDAeI4G8Lek1wqyzdFeijRVUGQTjeVf9WF8B
 d5EAe90FAy2zBRCjAOmtq48PJjul9LU2C6Z1aBCSEE5SFpvSt+WBH1gbQzS/diuYf842
 MEW0LhWYOMviGGdH7kFIkWGmpa11lMvNh1PN8ep6w5DNagTe5XzKLJBikDhno1wAeWfK
 27Ai0uHT+dKMrR6vZ2erB+IFfJXH6YaSLGiTBybg8L9vCLcihLRDVag+1q6/bDmQQcWQ
 SscA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl+Y4oUsRqjlaYgeycNvkga2vwkEGIMgSge5rsTSl8SXT6ALJC62XemqE1I93jvS/A/AEHBoZN7bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQDrfL9zLR6GdocEqFi5YLMqxQNVF3UV7jaMouC8fkiSWrAZ2R
 4xoUKmb0okHGxhVXlqP3RHpflXxVhBMuGM6bs11dJ4m5TX4eFMAh7ejzpGOT2rI32zyGUHqa5lc
 86lSH5Zs4lYWguVkpmU/bRuryAlL13DUotKug5ueZ7hyG2FCa3u3hhZ/RUp/oUg4zhZmRjPI=
X-Gm-Gg: ASbGnct3SwzM9vWRncpRCCP6yZv3PvhmwgqyhJySEDBuqw5rftUvf7Dyb1keRXDBVTs
 yXyRjujs5nIaIOiw5fSCLSmGjh7yCTsAcwVyk64rJ2PlyQpj9+nYuWGhwCHfJDcxeFy3EPrsg7T
 OIavu/5BXN9yZ0BSMJTfJui3XAGmBEZVTSX9iqcswMzG7IbbPjO3DJayR9XYq4XuwovAhpmJrkt
 ioXOgMQ+gw4YSv5tYl98CtGEJFoQLoPp7dF3M0EW+NT2BP9uCFSqquWfcbqG8xBnNrdDIpctMc+
 UZKl2ziVS738gNQH1OmnQ6tlqhWod+UlYSGyGVnZ2Elu3Pwzj8VIZs+1KN1PZ8JX1llZa1BpP3z
 6PyBAZSzdaKxfwwUGirpZTeH1RcX4mg3P4nHhNDlRC4AGZ4lJ4F0sJzP2
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id
 d75a77b69052e-4ecfc4d794amr21511071cf.10.1761572299586; 
 Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM17AQ/vx93xjYF+FCEIiTUB1Xqjgbo4dv3HEB6b+9AnxRB7kb74w76dLXL0z+Y2f1ynGSYw==
X-Received: by 2002:ac8:5e10:0:b0:4ec:fc4d:372f with SMTP id
 d75a77b69052e-4ecfc4d794amr21510891cf.10.1761572299193; 
 Mon, 27 Oct 2025 06:38:19 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85398463sm747816466b.34.2025.10.27.06.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:38:18 -0700 (PDT)
Message-ID: <490a7cd8-b093-4f25-9c9b-85a3c2d86a6c@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027-dpu-drop-dsc-destroy-v1-1-968128de4bf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff75cc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S0UzETgM28_sssm6r9IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNyBTYWx0ZWRfX5G6JPKfRgwPg
 SKJQ6dXaRdkU84Jjfo9Y6Vtg6UObRuNJT/D5wSAq3UMtvfT1bBKFRWvCDKpNNPduxmO22j591S6
 CqJ4IC20P5TxNDcBpJICpqroDHEJjQ1NfhO92af1L/6hX8RiRQRQ0MAJkv9hfgrh8iK0WdhcL3B
 NBXoGKMSQ/O58y0QXnbliZZ2xjbg9bzY6BGFruvgHZSG76gSQTY2xHTTUZk8jx+CpZgYlm7DGhA
 7UK4gUbLydhlJm0goz+XxWU41bQ3Jftf5ueHDgKUPZB/3hk7nMAlP+xawr87Q+FFYY7tEDPG9aS
 +LhXe9gwkyHi0aSOwegCEyHSJ6OlcGNSR6UwBf3mRdZwd1uUoYFLI9I9KKRrWn2Zdopt/y65opp
 74O1VWyNZmTWJF85/+TkmPggv0YEWg==
X-Proofpoint-ORIG-GUID: bPCtL5yin1f4LimIJ0cqhMTFhkCTXwdw
X-Proofpoint-GUID: bPCtL5yin1f4LimIJ0cqhMTFhkCTXwdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270127
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

On 10/27/25 2:35 PM, Dmitry Baryshkov wrote:
> The commit a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for
> HW blocks") dropped all dpu_hw_foo_destroy() functions, but the
> prototype for dpu_hw_dsc_destroy() was omitted. Drop it now to clean up
> the header.
> 
> Fixes: a106ed98af68 ("drm/msm/dpu: use devres-managed allocation for HW blocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
