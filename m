Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049DAA7E41
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 05:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3E10E2DF;
	Sat,  3 May 2025 03:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNimg8F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3910E2DF
 for <freedreno@lists.freedesktop.org>; Sat,  3 May 2025 03:24:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5432A5qe012875
 for <freedreno@lists.freedesktop.org>; Sat, 3 May 2025 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HNn11L6/OJdqL1KxlXTIOqrP
 MSyd/4d85l4dZRszfNE=; b=mqNimg8FgKNPkxiVarAAUTad7ddxgTRQAYpKfGG6
 sXGc0i203ddz+WMgaLCFslK9m0A6rZrgnKmebT86cvlZxQzAZQWHJYtG5uCQFNBm
 7pOuqW9VXfvsmR74jnKhOMr5a1nvjVzZDHTmYtGTIVAOWqkCCh1/mIEFIpEdToOY
 6zOWhw8ejDWM6TFYiayelzkzmtrapr3Fwp4oAUEiVgEO5JG+zNvYEWCHp2zJrFoV
 cVukF5AU5O8dCQdzhqLyzB4tK4gmULwGFtsJy7aVIfiCexma6J4LWntq4kzFDTHS
 3WEsIE1HmirLiuWqXB8N1klupAEOFU7Q5q33a9qUBKIRoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rr2qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 May 2025 03:24:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767bab171dso29971771cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 20:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746242656; x=1746847456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNn11L6/OJdqL1KxlXTIOqrPMSyd/4d85l4dZRszfNE=;
 b=GKPViMTyWP8F7Vl4vEWCYGLhlRa8DMVGnf5uzXsgeoqg3lbNZK9HDIk4RnwiAYG2EY
 BXa0eg434Yjj06FBRR6tvCaaXl2U13+5Pu8YPO0ELspNG5Tz/sHNvFzfrHhlvAqBzU7/
 ZZw+TxTOKll2qodaaGgJtC766ekpD1DLjImkdcH8I7kexh13J/eAwkvMV8HeJ3FPWHmb
 lqSZyFTx4gcDw4dYq+xdgdCg2qvVnZDWlRqOMjGsS3zJ/bcHE6CnP92yY132i2l4qvt5
 FmUpdtXjVUW+99xpm7NgT6XS0kbVdO5yctf8VRgyF003SzrdWJ0hbM8ePMTAhJxveth8
 HYJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6eAydxRNOSK8JL/f5RL+wDRq7P5T/gFu4ify5+bT+ZtwjNKzyvMUy25rd0nF62++Wv9O7wsekIfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo15MgmEZYpqOFIR8mwc1NeVTKrygqouuD0QVrrtzXJ5iBY9Bf
 p2ChqmbAMyLcDL2Kx09KP0v8s1Dc7V5BJB2M6EyqWoyFCLgR7770nwnHQhX7xTz/eeKqnD9Tcme
 V8O4Gm2yK7JFr8rwlC6mqW4UD4KxrOPCYSQ35dr2I2kFNEFwHqxBHfaAAPDGVage0Bx0=
X-Gm-Gg: ASbGncssHGF82nzm+KoT6gplwd5Ip9s+UA0uTO3nTWgWvhwL75uL7rDD3sNH66OfKWB
 0tabesi6YPNLr3C5GqyTL4WPPNBgSyKtcACB9xBnP+ctvLuv3OEDin6XidzbqNI9EqSFAvsounI
 kRlp+jkP2Sk7jrnlOUt4T/pWItYcnK+9XbE66xjLYdJmU/XptHWMp6qt0qc4N0O/j1ZeCEUQbPR
 CGyc3p9iXBDHAfRxR0qo6k0qgh9YY26aHrBp63ZNUIJR1xZ6mSqxNikBhbPUqAcFEkjvtF+o4aE
 GHDbrTW9CDI785X8gHJ3Zdo5em2aTPCVoPmzSE0XvAkqSDuZefj/STBFzjAvBCVglcbNC29Ox6U
 =
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id
 d75a77b69052e-48c30d80333mr98285481cf.4.1746242656386; 
 Fri, 02 May 2025 20:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Nh9w5WVGC3RST0VkgGNMJID+vfLETSNmPjq/gLaq5uaPvrEtf8fnY9OXH5/qZ29zeu9ZRg==
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id
 d75a77b69052e-48c30d80333mr98285261cf.4.1746242655974; 
 Fri, 02 May 2025 20:24:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f6a9fsm605856e87.234.2025.05.02.20.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 20:24:13 -0700 (PDT)
Date: Sat, 3 May 2025 06:24:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <nxft5c4fi3pmm3r6y46cx7nigto75g3j74qmtcyyaysebegvh7@vseouireocc3>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
 <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
 <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
X-Proofpoint-ORIG-GUID: TfQtT0nstNsdt9gXdK1f81rQtfIQrpf0
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68158c61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=H_hWaF1uyuAelWpSFMAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TfQtT0nstNsdt9gXdK1f81rQtfIQrpf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNSBTYWx0ZWRfXxDC5L3ZGfV/g
 yEb5Gq/KrdlgXStjy4vcDAzvNhPxbpClpU2gXIcoPl67qyBUKlnjVVCDUAJnFa7bfyK76HkDjWf
 elqTi0ks+23Zs2r2hvFyrAgY1vDEshv8psOD5sjh1D/bTN3k5muntGxEeie4ORUTpE+j0o1IJze
 hB2HZz7pxxQIa/HputmPIMUkRESMqRo/ojWOw/yxngiWaEASrP9zg/6p7r4iRTq5zTtoEvG2fr3
 2JOr6vN/EdERly3zdgPiSQlyp60S3bMOjYtPlgQ8vVfABPMM75KUeYNkucB7Ht6AU1NHYkjAQEb
 eo36iRT3YRuiL7p9UJtowIUMaeFK1RvL7RCpvO9Blt/FVWEodcY4iT3DRTyqWIPf3eV3+aLfpp7
 JPi/lmwrfIzKUCvlQxlqsQ3kQQ4rQkMXgtkm3sVSNdJOStA2ZEpKTgzRGS3p1IMbsQ7spHB1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030025
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

On Fri, May 02, 2025 at 04:01:35PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/2/2025 2:54 PM, Dmitry Baryshkov wrote:
> > On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> > > 
> > > 
> > > On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > > > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > > > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > > > Section 3.6.7.6.1.
> > > > 
> > > > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > 
> > > Hi Aleksandrs,
> > > 
> > > For this patch and the rest of the series:
> > > 
> > > Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
> > 
> > Were you testing in a setup with LTTPRs?
> 
> Hi Dmitry,
> 
> No, I have a setup with MST so I re-verified SST and MST with these changes.

Ack, thank you. I was hoping that you have some interesting dock setup.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> 

-- 
With best wishes
Dmitry
