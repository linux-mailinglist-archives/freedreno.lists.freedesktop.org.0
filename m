Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29DAEBEA5
	for <lists+freedreno@lfdr.de>; Fri, 27 Jun 2025 19:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922D610E0F4;
	Fri, 27 Jun 2025 17:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bktBNDHk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD4110E0F4
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCNv0N017812
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=; b=bktBNDHk6uXDTEkc
 P3hPdPknqjLUHgdbQBnOxh0EkFLa3qjGh0hsd72BMxnmtzFKmSqT3MZn6H5wQFZn
 esyndwzb/ajSbcEuCUFWD6HeppBAWxX45VTf5anMua3JjOjDl+mRUxlIT2fh8DNb
 LFX7XX7JeuSDBYFs12oq1x0qRnbASgbjTqZmYwvKsNNPX9rzMduNHgdttdd4TY79
 htJBfVjiXzKr++u0m8uUbvkV8dJgth9Zp6qf3fbyWl1ej16lGxZrKGOczkqGWWEO
 qMsuPvV296TfDskYUzZ1Cu4EyhSKTYnjECJUlJ25z1D0BUiR4jJOgy6b2GMsZpN+
 HWYIcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5xwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 17:55:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4a43be59f17so4162441cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 27 Jun 2025 10:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751046932; x=1751651732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=;
 b=luYzs2WMdERlCuqqSsQVHu5aoDObbWfX8jL8a0xzuQP6ZCHlcICBSO6k5QCCIhsPYN
 14QHe0A6MRNT44AP993GWMqDOyGpvNBFnOKEdOWcd3qCaGxGlfIlgBEksY3U5DNlPMPU
 Gb2fCgfycvgZq+NNudJHrb9cX8y0eVfWD29OPcjNzaJDlcXLf8qUw65pjirhRXQNl8xL
 lDC+gqd+r9c4iEAQdL2/Xvkh+QDSC93R932PjQb+H9wzQUvkM1Gk1mQJoS1U5JgYxWQE
 YayGVB1djgO1Nj4UpYvfLtVwHc5Ioch5iiBgYXxMZUP5Qd5xycebN6atkooCDxj7aAGO
 DiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXkDHOOTlzNzeD6boks6geihwxjUeevYgASS3Da83sKGLSpErffOSztvN8CB9iOEZu3sNaU3eWQRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQzW/1TLDj18XbnvvXzV5iHoZCuSEqMhYqhQiOrZHN09tlBRYN
 YM3WbWjL1AQMskSBDYWeRGZGjGx0UL9fMmDeMehm89ltg/2HaTU/4VQiRR6wfUx2h0vCVlbTx62
 VaiZX3WNbM5IJ5YJnG+w7nF7oLnRUtvk56V4jtRAvpjYVS4czY6tDhkyvMVgB1fj1HRhSKx8=
X-Gm-Gg: ASbGnctYh/PRKXg4/4s0eShFgpQAuYLC3BPh+2l22ugomSdmzOhij8DymCP29tv2i6n
 ZRwQJFJHMmlXrizsj36umr+vyTycMczby8AoA25O2/NQ2RWpXGcYMx/zAiGLaLFexwYOtRj/ahX
 o5RDZg7KHsuObZMf7vXe8qY5OKwCulWjsCTPeWq1wiACZ4MW875zxIlf3HthJkoUrGTl89A5toE
 9k4voAOFGcFS4+RscPREbIC+wIidfp2whdnYX7pChO7qe7vmFDgSvWFVYLIxbCU65DqQcqgxwhm
 JF+Pm/4YXYSP8HyIoqQuJlrajp7SHdfJb5WTIphHdCjiOE1iA6iduxyYITGheO7Pyu8/mpDleuB
 9Vt0=
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4a807390ff1mr1923101cf.4.1751046931764; 
 Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjS6V7nSMnoKIToCQDAP4GKzUa5d91t9ousBqXncQjQ5eyhDeXwLOlzvN8i3GRTqy4F6YNGw==
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id
 d75a77b69052e-4a807390ff1mr1922741cf.4.1751046931099; 
 Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c828e1a96sm1778182a12.19.2025.06.27.10.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 10:55:30 -0700 (PDT)
Message-ID: <80912fb3-2af3-48b1-b81c-89bfcdb54841@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sn9d6aKZVjeAuVe7OCihXtyDUN88vRKC
X-Proofpoint-ORIG-GUID: Sn9d6aKZVjeAuVe7OCihXtyDUN88vRKC
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685edb14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MiDvfStR0l9wvLywkEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NSBTYWx0ZWRfXwjO/Yb17xQvU
 7fCYhBV8f69Cy1z/8qs8ze0fxjlT5cEAJFmeuelPwBdozba+c4veVm+ka3D0P+VD6w2y8mhnE6n
 83/QoQsZOr5pj9bz/MA0dRMYYZdA5m3oupYcmXY7xj4EW8gC5vO7Mg3j+otnWYC0GDmm03EUeKs
 umR3Akq5074FIjxSWn/jXyz4ydRQ0ogz5tSrFplXEKGrB0gQDC2rasjuIeM/VSKQ4l5NH+Utdxd
 +3YeLp/qpjEwbSAKS9MLrcIpOUSBEWfaLp+ZgH4tx4dWhs+yxhQHjUJxNVOGw0itycs8HKICogm
 1UpcLKe3X6S6d3YugsiArADIt5qd7nJigpcI3H/fCymBeBeebaNnyBy3mX1jIiJ7obCt4uayXZf
 bLVNfmgJ5J0WtDHQsuNt2dqm+PnCfgU1/ZRTr7vVZAm3DofU24VDQq3osG+AjwRuy07xqgUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=827 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270145
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

On 6/27/25 7:18 PM, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Nice, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

