Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED3ABAF19
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C7510E1FE;
	Sun, 18 May 2025 09:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZJskLuk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8477410E1E3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:49:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9WjHA009727
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uk3XmHMtZKL9KyAJ7vLCOFV9
 j3YnYGhoaY7wPOpdmB0=; b=SZJskLuk3du1Dr5b9j+Qx/OL/HjANFbrFfMOvLM+
 MjZBpkNAfkD9uYjoiNuhUK3h84+nOZMc1L7apJUbwMCHEZgYYr1dqz7sb1HoW510
 buGK5tnwdDMPLgJutpw+xW3X2S753YuP0xmpgyTRkFLrvok9kf6oLNi0ErF40cx6
 Ayp6ro+LHOtpCC5yahNK2umqdiONQBThK8Kn2gVivkhJ5igg2QyzvHiDUozfcgrI
 t8m9pIX0PVVlM6zmCPnxLgnbr0pROpTpkyKpAKWoKbmR96P+t6eNSlikNFeoVKvR
 rbXnMx2ucGqRZOj3wK2uwBdz7C8pRnUNZYrZyTvVng7ypg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju79skw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:49:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8aaba2f62so61509266d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747561753; x=1748166553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uk3XmHMtZKL9KyAJ7vLCOFV9j3YnYGhoaY7wPOpdmB0=;
 b=A3qgEiz4/QYqTWBwBxXkJ/w6NWhMLb8TUBzGnhAHxAYp6Z9l/olQWSfgh0vwDBWPOj
 kluN/N/EdEUOb83T2JX9zfQfvyzytyc6o6UQYbd51ItypHpujsDQKdWbevG1kfc51LmX
 b2FixfIyDU+f6yMYrCh83OIPo8l+3rwKUfZm4yskGO2kM9vmH/GjUz7iLn4rLB5SPaxJ
 WjUo7pk2eNgteEjzkC8uJ0CAlY2zeYdF7jR5nJ5BaX9HUmve6RuIBaot+ZPV6nwvB2p1
 KrlVtzg0UtTS2udY0WZQ1z3o9NnAziXh0qv22wkSln6PWuaphsoUBJzfj0xsWv6fA+lw
 BBEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaERbmOWoGadf7B0tcSUeb5WonN0PrYTrhEkI3l0kO8nTepuucjKCKYzwFnWJ74NP2YK5W2WJbk0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYJJICpIP08gvehZZWRodZHeysCf3kDVNlQIHW8Cb8MLAwT5gF
 lAa70u57r+GCv9NyQNI6Vh4bcTi5JiAHY8Ff96vDJ/CwXB8cL47hatilogziFnEEL0fAOQRX82K
 i7ubemJbBLQyuC5aH8pNoFphAmPuvtxToPwmtDQY1Pgn7J0qsfyW/nhIUgofqoUXyomo3MeE=
X-Gm-Gg: ASbGnctvVzduwcL/tO3wsK+guxPiHaPzZlx8tF5wAof58l+gyl7w5VWj4avbypvwSla
 dafWp/17VKw80X/qKHCnvOJMzweuQNn1wAj/By1lLIAwqMVcBqARsMx986VbaWtxIHMNF/R7yqb
 gIB6sKSAr+52D5nHxihdILczkQAMPVmzoHso/5FdW8wstGl0Y/Ix4jIuM5977WiYsaUhqRE9PmE
 mix80Ue0+kwgOMHOmtNN0+fJch71QBSDbTgowTUCtgaEdSqThd8AjjrjnlwQqvSDAlOhlQ5A1af
 RbdrctweOiOjsmPLKUZJRgswUX9NKHfaneysaT5RaZY7s/+PQa7Jws/PNfGetxGSJoVFImTUA0E
 =
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr30939336d6.15.1747561752862; 
 Sun, 18 May 2025 02:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB6cOXuCp6Ea8OwMdD+YYtA9uX4ETpwrWWSJ6+rASNTDgvLSfjQDY3rF29CklGqPF6j+ijsA==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr30938976d6.15.1747561752424; 
 Sun, 18 May 2025 02:49:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f16584sm1356425e87.44.2025.05.18.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:49:10 -0700 (PDT)
Date: Sun, 18 May 2025 12:49:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 09/14] drm/msm/a6xx: Resolve the meaning of
 rgb565_predicator
Message-ID: <6shba2twwvusoud4grdmagparzg7bostkhqnrohscqd6bik2iv@gvp6t6lklyk4>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-9-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=6829ad19 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pZ1cKns8_n0M6c_4lVMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 7cfaTlpt2YfGidReu-X3i95FpzVEq3Gf
X-Proofpoint-GUID: 7cfaTlpt2YfGidReu-X3i95FpzVEq3Gf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5MSBTYWx0ZWRfX0NRDpolXPdIg
 mSEwy4uJu0tjsV51gK2bHZjA0DBseblhBjAyYRJvxSuswV+aVj/SOFzhcoiH5uOhx7AJeQK6MYh
 BUMlTjmv5GCIe1B2MtCiFO/EkImPPbKX1ZXBgLjj1tgT6P3dbSTQYoaeABRQctGNs45erk0nrKN
 fkF/nkaB5UMUegRHzLNKCwWnUUgMsIX6omt221tweZNlU2+SHqSQgxKQTIRprbV6Ee6zLMj9dL3
 MGkrla7uow1qqOPvVVcqPOy/Uza81Uk+Vgy9cYuauHRBRMwSJVwgiX3AQEWfTwxpTBUVQvCzoA0
 qQum6pwQkwYTtj+bFCR5VRnbZgY80yales+wrzPnVBjh2A+DOVNxQtEmLAsPe6hWtQaf6MN0K0X
 lbMpK0BiHzAgFd2mwQ2V6yQCnlmFA1Nui5jRmnPn6aTI7PTSrtJsIyfRaaYNmfi+OaBDyZZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=805 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180091
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

On Sat, May 17, 2025 at 07:32:43PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's supposed to be on when the UBWC encoder version is >= 4.0.
> Drop the per-GPU assignments.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
