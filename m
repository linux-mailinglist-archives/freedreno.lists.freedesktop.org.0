Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DCAC308D
	for <lists+freedreno@lfdr.de>; Sat, 24 May 2025 19:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF01810E0CF;
	Sat, 24 May 2025 17:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I60MA9Wa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77510E13C
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 17:15:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OFVwNn031118
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HoKB7FoEFd+ZhxUTxnT07Hez
 elPHtrNEFYztHvSBeTM=; b=I60MA9WaCYrQl3K61kG7yKmYGl9ROeRwT/67lMeC
 reb+NGpNPyHnfdqVaAf2cBYgnc/1QzAhQbXQcHSHwwchJBZnWmucKKXIryhgowY4
 vk6Gs5AIVJ0mGfMgmpH7rDumAlHDYh0Lptcnm0vC4hYmrbm7L3rQ55sQ6vbyjS1V
 OLffzTCJkiDbWpEKWpUsTzVS/qN9w9j2JlwYhwlNbL1V5J6SfhXPY/PjmNHCsUTb
 Ei7Rc8o7Gnb63DjMuXrepEITpjmMZr3x9EKikdixyjPeukufEmRKuRwMRaKWH2wx
 5OWKO+ccedjgwHdCZJSP+R/WVHbKrU65gL28Nxpw3OsFsw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p0v5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 17:15:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8e7b78eebso24652086d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 May 2025 10:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748106949; x=1748711749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoKB7FoEFd+ZhxUTxnT07HezelPHtrNEFYztHvSBeTM=;
 b=LTysNVD161X0HWb5sNTlyf1FSYfujUpX/Rj2hq/9KzXe3GId4kH2G6+f3/eLcSD1d0
 DlyzE/p5sj6XnOvL0PBGDFRECMTCu4AuGrI5zDwSvMxL2fd86dYj8S4J3zkJ7Xzh0Xq9
 zeHYdOEJjcMfs+SZg0PAK36lwzM18Bi0g0zXOnvXD/ivxbNu4kP/zyNUVYFfDuftj4nC
 VALZSt2lfB/SokwmV8w7RWzEuV/AUqc/nD/ECkZzRJkwalKiNvgMs0BH4wRHPkVrdeFu
 At1PUa7K9Famfdl6hTc/QPWavka0BJEiQQjioBKDnIdsfWSTwgmqBtkkhUC5pprjjE67
 MpnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO8/Od43NPY0C69jlH1HxrV9LmCVqEuEMv/eb54vOKry6KpqrnCcjaL3dnSKud45drmpOrLFUAbgc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVKRCQBOb4hfuj1aIQEuuuaskPPxzUazcdW51/AtS+CeUVau0i
 VCoS0JVlK1tJcc53kNr8n+1oszc+Ttdrjs86wVAQPOSAGblHOPJvb62JirVYFQgJcIKVt/L0wBL
 ewNCZ7QDpakVymw3L4Kr2/p1o4ix7sZWDh7aljm9atjIg7mwHgbtSqeGtog2KxIvnFWu654k=
X-Gm-Gg: ASbGnct2Ojv81D70lptMXGwoCQ3q5UD4g/JXhHxgmcRtM54w38aHYmwI0iB/WlKGtJF
 6nciaEKiyb57FPf5PDxEvr1wa2yMYwsmy/W5BLuLNjWVkNBMLtCW3EMTpkPtnfQYjcD77wj6AHa
 JfAoH/J7YdtCijuDDhgSxb/+bczHC5msbpVxCtW2otGE2SMGVhp6ZSO6gMSGEkukpYjUZFYYumm
 7WKyp0qYh4zKexB+h1X4P/bjMQreFSpDapJEwWSneVaAml98n6VcI2ZOxK8rRX2zvg9sSp4sEwb
 92aN+5rY2F5Amk7fXVXqbxaQwPJqj2VtE7CgrCU3LLPQ5UXPfo3EtB4gSkKH34tE2tIEza/6ExE
 =
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6fa9d28772fmr67452186d6.32.1748106948900; 
 Sat, 24 May 2025 10:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIqkv1DDylW1b3GD2ViKAIAcTr7kO7D7YE6wGfo1Ri+34/iDrnom1wZeOY+am9JzCmMIPeew==
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id
 6a1803df08f44-6fa9d28772fmr67451546d6.32.1748106948491; 
 Sat, 24 May 2025 10:15:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-552133120b8sm1112985e87.121.2025.05.24.10.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 10:15:46 -0700 (PDT)
Date: Sat, 24 May 2025 20:15:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-Proofpoint-GUID: siDX1UpcUwTbL_yolXHa14_TM9urfHXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE1OCBTYWx0ZWRfXylIw54+cMQst
 15WR43Anm4BO3h0/l5HzTZqWD+2r9li5bG6ioFtBz/rc6gYIWl0qy+KGq4S/pwUvrrHpPc9EPnf
 3LBQkfkodeTWkeQE1mCMMNN6oVBEVXrvN1aLQEYB24Si6kVOhWt0InQh7KgshYf2653qbFIK1aw
 XkmpRYJi2y7PHKWGevN8AA3/A+6n+/8hLiMsRKh2Dq7zxrDMGx+kyMd19KKFP1ACemkjiWsz615
 cIP8xpCwrckvlC29dGkmGnc+gJCogPZ5OlhHPFRclr23mMtcfmnanoIF9hH7cFTfXWwZfHOf7tz
 q7YXz2XWoGrRQGA5hMdohLLCpUx3ROB7/0ib9OrFnYlktKk3nqpzFvz7tnNPy3NT7nGlvnz9h2Z
 iIjgflU2jeQCz93xTTcTOG2wSi/UU/3wjJ2JynLTyACn7FIhxeU+kL5FR4dJPgk0jpXZknoh
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6831fec6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=CEJotdllt_GKsxek9pwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: siDX1UpcUwTbL_yolXHa14_TM9urfHXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=921 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240158
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

On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies
> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
> The files generated by gen_header.py include the source path to the
> input files and the build date. While this information can be useful,
> it inadvertently exposes build system configuration details in the
> binaries. This hinders binary reproducibility, as the output will
> vary if the build environment changes.
> 
> This change was originally submitted to the linux-yocto-dev kernel [1]
> to address binary reproducibility QA errors. However, the fix is generic 
> enough to be applicable to the mainline kernel and would benefit other 
> distributions as well. So proposing it here for broader inclusion.
> 
> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> ---
> Changes in v2:
> - Corrected author id
> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Rob, WDYT?

-- 
With best wishes
Dmitry
