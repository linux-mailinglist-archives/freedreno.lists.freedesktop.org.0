Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F7CDBC9F
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 10:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA10310E9A2;
	Wed, 24 Dec 2025 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ok9KKlV4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eit4/Nwx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7505010E9A2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO180fk1598800
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=; b=ok9KKlV4XJpKq17N
 JYsY1Fr9t9IJ04vSV89xh91SV6+VicJiRj7PpygLUVl8nro9knv+3sJFCt2QKIyG
 Zr+QLv7q/1+IHQJAWxz8w6KLvO8stQ6y7XJWei4sjGbSR3/AM9kAkwuJ+8BMFU/E
 L6XI+7VmjhDPd2HRl53Q2SoyLpfn4dD6kcOA+jkfR+1+GXQC0Y2SQgi/WUnEtgl+
 iaCpArVRavfKJqPh15sOTsYi5BPddmKJY2a8B713qOjONSI5TjuKcynp3G/PYGac
 EKmJ2vyhJ8J0xZBUltsXXfLw6vUxatmxOHdphtHGvMfCqdPQpPok0TnTENS4bzLR
 bgpv4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h5sg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 09:27:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee21a0d326so34398681cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766568471; x=1767173271;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
 b=eit4/NwxRXSmVztFfiTYo8Coxuva7VH7WKNpMcivIvZdbQSMKPBa3ShMBM6UQSKAig
 UQk+PpmdDwLu9BymDK9RL2VKLGElt5M8iIBpbiJdKOrYNI8a58/u5Iw+nGHMzvKwUOai
 Gk8isBzgVO2nrJp0b6n/UtkO0r80vRuNUd92uYoP2I1H2752nUKMSWEt55NjA8+hl+/l
 r2PIgvSNhoxfqy5Bgv3eaP5h0pZBSyMYBGvc6Yw9mKEuA4vNowzVjIIT6BQOKcCORWXg
 puYCM5DNg1yCkBFBawkC2RgB2Gz0Hi5XsclCAOk3NLB4AP+bcJQQt//fxVprKjD9Robt
 tdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766568471; x=1767173271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u8k+Pmhnyb1OZaX3h7hgT/iEpR5pAnzk+zg0S36ixSo=;
 b=VmJxjiNE9JDFludUCgtxSJu2nmj5VtwshZdW3gyppQaeMp4FFJYUi9SPUAAIdjPux7
 3cb6WRZrZeLBisVmgzB+93JriOzFtWpPLlSDKxRNH50SnlDw0yUAF9zezKjfQzCtg06U
 qoxXwXfiuHmoQYBj0TEnAblkWW930QAW6YwoVEtTshCNyd6jtEgG3l30jKZmSu/tI15x
 Z2oWAZGwtBi3eGuc5cFMHNnuS+I95sautpy45YKEeUuLYDsV5M3JLs/0BJqUDQGKuAxn
 PioqKf2MG8j0fNHC4RK1mmmCZo0cy8Tjf5SOJBN26LCna7wTxeT1IOHMXvDMEEpNz2+O
 FDlg==
X-Gm-Message-State: AOJu0Yx2IfuDrjB5SKOzztSi3Z5W/aba0abStpwMIff0mtf9a6AzzmvG
 f0W5OoAxfBa6GbwuAgwbkx2+hFoqUM0Kr61wViOjxbdnuI5NAZra6bE4ZhoAQ18uXUT6IixKr+A
 A4Wq6KG+oqr/eKgGcCBynQ+hUvRtsEy0mxZ/NsXvm9oco5SoABhdCFP1hi+lBMW2jbIw6Ip0=
X-Gm-Gg: AY/fxX7ntoJ/j/ywaI9um+Tk6A24shCjCzmakAOSW7n0W7vGOADOk5FRKd6gotnHb90
 rMzoFqiInQVHidYgwspUjvjR5QSk3igQiZNGY0tOgu5yCUl2U/kXEk206YUZv5V0rgz1BPDtIg+
 gPGlavxTHpxSvtsXFteuG94YAG8gci38LMmAp6RzBjkr8mpJW77lyllp1T1439ZLeNRDsYzhype
 w2JWpPil4yceVwrzns7ogHrLS6vvF+vz8r2hWyBJLQ+fgV0DAWZoYYKeAf5kdoLq+RGT7xTeFzk
 f55umVAA3ftwstub3kjw807EoM01EOhtx87GTM6+v3uQEyfqzty1L59oY5Kc+31EPSUCbuTmZAG
 4OYUSWVd0EjUGQJZbpvk3yZDVAB++e5EWBkhw2bsMFb1OA52SISqRFr1fenSazKAHSjMBbf2Nl0
 34szWZIukKynbyvcw75Sc8wmk=
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id
 d75a77b69052e-4f4c0ac7d89mr120700961cf.77.1766568471106; 
 Wed, 24 Dec 2025 01:27:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnEB1jS6cRWODDStA4PaW92yVJbmN21zNKm1NrRAJ2+26mthUzC2q0CzqbuPSiUBH5J4EUXQ==
X-Received: by 2002:a05:622a:8e10:b0:4f4:c0ac:6666 with SMTP id
 d75a77b69052e-4f4c0ac7d89mr120700791cf.77.1766568470698; 
 Wed, 24 Dec 2025 01:27:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 01:27:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Nikolay Kuratov <kniv@yandex-team.ru>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Date: Wed, 24 Dec 2025 11:27:44 +0200
Message-ID: <176656845705.3796981.3831136316758674761.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GosoHhR2bLwKupK93IE6nuBvqK29wiJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX/byxmHSQUF9o
 vJ5vAPAMwHpfay2/RXoj05KbM4+/62rzru/xyPRqGkEqN4J2h5WjRSNv6kGZtcL+Sx4sHJd8yWo
 rkVK13AwfwGph6SF8a/zUyJZw3h58W3K+ZkfFfffJbCPXTcpJnzo3Rw140uPLr69B+R4GfNjuJy
 ba2X1tEB0ZElNJjYF+4GEc2eE5s9v4Y7575xaP3mjBTQyf/f7Abyhgtez9AOncPDe5HOo8uHA+E
 fQAf56hTXzxdqWbml3rr3IGdAUi4kAKMfzrQ0WGMufybL7Jkl06KZdSw/6KUe/e81CYbwB1Oj37
 uKLVAHxXADGF25VKez9bfHnvq9cEyXJ2OQj2Fqnrhw1HQJQ3YUt0vBRSONIQpVpStOMFt90qIb7
 QJt6Deg5oc+Uv1mxlFz3XYppaGzny95ZSzareUkOTAOxCTLE7CFVJrL5JuPfwi/9KYlxR9BhW2I
 0bPT2j5TA0qrEzn2XyQ==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb218 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: GosoHhR2bLwKupK93IE6nuBvqK29wiJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240080
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

On Thu, 11 Dec 2025 12:36:30 +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> 

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Add missing NULL pointer check for pingpong interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88733a0b6487

Best regards,
-- 
With best wishes
Dmitry


